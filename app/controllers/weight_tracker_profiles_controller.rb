class WeightTrackerProfilesController < ApplicationController
  before_action :current_user_login_must_be_weight_tracker_profile_login,
                only: %i[edit update destroy]

  before_action :set_weight_tracker_profile,
                only: %i[show edit update destroy]

  # GET /weight_tracker_profiles
  def index
    @q = WeightTrackerProfile.ransack(params[:q])
    @weight_tracker_profiles = @q.result(distinct: true).includes(:meals,
                                                                  :weight_daily_entries, :workouts, :dedicated_personal_trainer, :login, :nutritionist, :exercises, :foods).page(params[:page]).per(10)
  end

  # GET /weight_tracker_profiles/1
  def show
    @workout = Workout.new
    @weight_daily_entry = WeightDailyEntry.new
    @meal = Meal.new
  end

  # GET /weight_tracker_profiles/new
  def new
    @weight_tracker_profile = WeightTrackerProfile.new
  end

  # GET /weight_tracker_profiles/1/edit
  def edit; end

  # POST /weight_tracker_profiles
  def create
    @weight_tracker_profile = WeightTrackerProfile.new(weight_tracker_profile_params)

    if @weight_tracker_profile.save
      message = "WeightTrackerProfile was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @weight_tracker_profile, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /weight_tracker_profiles/1
  def update
    if @weight_tracker_profile.update(weight_tracker_profile_params)
      redirect_to @weight_tracker_profile,
                  notice: "Weight tracker profile was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /weight_tracker_profiles/1
  def destroy
    @weight_tracker_profile.destroy
    message = "WeightTrackerProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to weight_tracker_profiles_url, notice: message
    end
  end

  private

  def current_user_login_must_be_weight_tracker_profile_login
    set_weight_tracker_profile
    unless current_user_login == @weight_tracker_profile.login
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_weight_tracker_profile
    @weight_tracker_profile = WeightTrackerProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def weight_tracker_profile_params
    params.require(:weight_tracker_profile).permit(:username,
                                                   :target_daily_calories, :target_weight_in_lb, :profile_pic, :associated_personal_trainer_id, :associated_nutritionist_id, :login_id)
  end
end
