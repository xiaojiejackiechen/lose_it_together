class MealCommentsController < ApplicationController
  before_action :set_meal_comment, only: %i[show edit update destroy]

  # GET /meal_comments
  def index
    @q = MealComment.ransack(params[:q])
    @meal_comments = @q.result(distinct: true).includes(:meal,
                                                        :user).page(params[:page]).per(10)
  end

  # GET /meal_comments/1
  def show; end

  # GET /meal_comments/new
  def new
    @meal_comment = MealComment.new
  end

  # GET /meal_comments/1/edit
  def edit; end

  # POST /meal_comments
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

  # PATCH/PUT /meal_comments/1
  def update
    if @meal_comment.update(meal_comment_params)
      redirect_to @meal_comment,
                  notice: "Meal comment was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /meal_comments/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_meal_comment
    @meal_comment = MealComment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def meal_comment_params
    params.require(:meal_comment).permit(:meal_id, :commenter_user_id,
                                         :comment_text)
  end
end
