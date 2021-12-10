class MealCommentsController < ApplicationController
  before_action :set_meal_comment, only: [:show, :edit, :update, :destroy]

  # GET /meal_comments
  def index
    @meal_comments = MealComment.all
  end

  # GET /meal_comments/1
  def show
  end

  # GET /meal_comments/new
  def new
    @meal_comment = MealComment.new
  end

  # GET /meal_comments/1/edit
  def edit
  end

  # POST /meal_comments
  def create
    @meal_comment = MealComment.new(meal_comment_params)

    if @meal_comment.save
      redirect_to @meal_comment, notice: 'Meal comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /meal_comments/1
  def update
    if @meal_comment.update(meal_comment_params)
      redirect_to @meal_comment, notice: 'Meal comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /meal_comments/1
  def destroy
    @meal_comment.destroy
    redirect_to meal_comments_url, notice: 'Meal comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_comment
      @meal_comment = MealComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meal_comment_params
      params.require(:meal_comment).permit(:meal_id, :commenter_user_id, :comment_text)
    end
end