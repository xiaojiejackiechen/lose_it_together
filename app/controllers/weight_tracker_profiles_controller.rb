class WeightTrackerProfilesController < ApplicationController
  before_action :set_weight_tracker_profile, only: [:show, :edit, :update, :destroy]

  # GET /weight_tracker_profiles
  def index
    @weight_tracker_profiles = WeightTrackerProfile.all
  end

  # GET /weight_tracker_profiles/1
  def show
  end

  # GET /weight_tracker_profiles/new
  def new
    @weight_tracker_profile = WeightTrackerProfile.new
  end

  # GET /weight_tracker_profiles/1/edit
  def edit
  end

  # POST /weight_tracker_profiles
  def create
    @weight_tracker_profile = WeightTrackerProfile.new(weight_tracker_profile_params)

    if @weight_tracker_profile.save
      redirect_to @weight_tracker_profile, notice: 'Weight tracker profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /weight_tracker_profiles/1
  def update
    if @weight_tracker_profile.update(weight_tracker_profile_params)
      redirect_to @weight_tracker_profile, notice: 'Weight tracker profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /weight_tracker_profiles/1
  def destroy
    @weight_tracker_profile.destroy
    message = "WeightTrackerProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to weight_tracker_profiles_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_tracker_profile
      @weight_tracker_profile = WeightTrackerProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def weight_tracker_profile_params
      params.require(:weight_tracker_profile).permit(:username, :target_daily_calories, :target_weight_in_lb, :profile_pic, :associated_personal_trainer_id, :associated_nutritionist_id, :login_id)
    end
end
