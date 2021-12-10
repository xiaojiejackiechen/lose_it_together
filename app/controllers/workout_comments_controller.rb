class WorkoutCommentsController < ApplicationController
  before_action :set_workout_comment, only: [:show, :edit, :update, :destroy]

  # GET /workout_comments
  def index
    @workout_comments = WorkoutComment.all
  end

  # GET /workout_comments/1
  def show
  end

  # GET /workout_comments/new
  def new
    @workout_comment = WorkoutComment.new
  end

  # GET /workout_comments/1/edit
  def edit
  end

  # POST /workout_comments
  def create
    @workout_comment = WorkoutComment.new(workout_comment_params)

    if @workout_comment.save
      redirect_to @workout_comment, notice: 'Workout comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workout_comments/1
  def update
    if @workout_comment.update(workout_comment_params)
      redirect_to @workout_comment, notice: 'Workout comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workout_comments/1
  def destroy
    @workout_comment.destroy
    redirect_to workout_comments_url, notice: 'Workout comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_comment
      @workout_comment = WorkoutComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workout_comment_params
      params.require(:workout_comment).permit(:workout_id, :commenter_user_id, :comment_text)
    end
end
