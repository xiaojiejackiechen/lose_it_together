class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true).includes(:meal,
                                                :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    @food = Food.new(food_params)

    if @food.save
      message = "Food was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @food, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @food.update(food_params)
      redirect_to @food, notice: "Food was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    message = "Food was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to foods_url, notice: message
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:meal_id, :food_name,
                                 :number_of_gram_consumed, :calories_consumed)
  end
end
