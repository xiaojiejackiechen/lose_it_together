class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  def index
    @q = Workout.ransack(params[:q])
    @workouts = @q.result(:distinct => true).includes(:exercises, :workout_comments, :weight_tracker_user).page(params[:page]).per(10)
  end

  # GET /workouts/1
  def show
    @workout_comment = WorkoutComment.new
    @exercise = Exercise.new
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      message = 'Workout was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @workout, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /workouts/1
  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: 'Workout was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout.destroy
    message = "Workout was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to workouts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workout_params
      params.require(:workout).permit(:workout_date, :weight_tracker_user_id)
    end
end
