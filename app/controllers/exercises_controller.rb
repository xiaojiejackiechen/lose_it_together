class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[show edit update destroy]

  def index
    @q = Exercise.ransack(params[:q])
    @exercises = @q.result(distinct: true).includes(:workout,
                                                    :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @exercise = Exercise.new
  end

  def edit; end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      message = "Exercise was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @exercise, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise, notice: "Exercise was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    message = "Exercise was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to exercises_url, notice: message
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:workout_id, :excercise_id,
                                     :number_of_rep, :calorie_burned)
  end
end
