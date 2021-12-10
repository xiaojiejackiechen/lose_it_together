class MealCommentsController < ApplicationController
  before_action :set_meal_comment, only: %i[show edit update destroy]

  def index
    @q = MealComment.ransack(params[:q])
    @meal_comments = @q.result(distinct: true).includes(:meal,
                                                        :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @meal_comment = MealComment.new
  end

  def edit; end

  def create
    @meal_comment = MealComment.new(meal_comment_params)

    if @meal_comment.save
      message = "MealComment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @meal_comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @meal_comment.update(meal_comment_params)
      redirect_to @meal_comment,
                  notice: "Meal comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @meal_comment.destroy
    message = "MealComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to meal_comments_url, notice: message
    end
  end

  private

  def set_meal_comment
    @meal_comment = MealComment.find(params[:id])
  end

  def meal_comment_params
    params.require(:meal_comment).permit(:meal_id, :commenter_user_id,
                                         :comment_text)
  end
end
