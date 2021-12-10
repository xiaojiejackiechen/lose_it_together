class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @q = Meal.ransack(params[:q])
    @meals = @q.result(distinct: true).includes(:foods, :meal_comments,
                                                :calorie_tracker_user).page(params[:page]).per(10)
  end

  def show
    @meal_comment = MealComment.new
    @food = Food.new
  end

  def new
    @meal = Meal.new
  end

  def edit; end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      message = "Meal was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @meal, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: "Meal was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    message = "Meal was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to meals_url, notice: message
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:weight_tracker_user_id,
                                 :date_and_time_of_meal, :meal_type)
  end
end
