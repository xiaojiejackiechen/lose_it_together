class WorkoutCommentsController < ApplicationController
  before_action :set_workout_comment, only: %i[show edit update destroy]

  def index
    @q = WorkoutComment.ransack(params[:q])
    @workout_comments = @q.result(distinct: true).includes(:workout,
                                                           :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @workout_comment = WorkoutComment.new
  end

  def edit; end

  def create
    @workout_comment = WorkoutComment.new(workout_comment_params)

    if @workout_comment.save
      message = "WorkoutComment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @workout_comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @workout_comment.update(workout_comment_params)
      redirect_to @workout_comment,
                  notice: "Workout comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @workout_comment.destroy
    message = "WorkoutComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to workout_comments_url, notice: message
    end
  end

  private

  def set_workout_comment
    @workout_comment = WorkoutComment.find(params[:id])
  end

  def workout_comment_params
    params.require(:workout_comment).permit(:workout_id, :commenter_user_id,
                                            :comment_text)
  end
end
