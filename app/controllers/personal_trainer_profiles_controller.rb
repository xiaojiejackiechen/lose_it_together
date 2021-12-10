class PersonalTrainerProfilesController < ApplicationController
  before_action :set_personal_trainer_profile,
                only: %i[show edit update destroy]

  # GET /personal_trainer_profiles
  def index
    @q = PersonalTrainerProfile.ransack(params[:q])
    @personal_trainer_profiles = @q.result(distinct: true).includes(
      :weight_tracker_profiles, :login
    ).page(params[:page]).per(10)
  end

  # GET /personal_trainer_profiles/1
  def show
    @weight_tracker_profile = WeightTrackerProfile.new
  end

  # GET /personal_trainer_profiles/new
  def new
    @personal_trainer_profile = PersonalTrainerProfile.new
  end

  # GET /personal_trainer_profiles/1/edit
  def edit; end

  # POST /personal_trainer_profiles
  def create
    @personal_trainer_profile = PersonalTrainerProfile.new(personal_trainer_profile_params)

    if @personal_trainer_profile.save
      message = "PersonalTrainerProfile was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @personal_trainer_profile, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /personal_trainer_profiles/1
  def update
    if @personal_trainer_profile.update(personal_trainer_profile_params)
      redirect_to @personal_trainer_profile,
                  notice: "Personal trainer profile was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /personal_trainer_profiles/1
  def destroy
    @personal_trainer_profile.destroy
    message = "PersonalTrainerProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to personal_trainer_profiles_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_trainer_profile
    @personal_trainer_profile = PersonalTrainerProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def personal_trainer_profile_params
    params.require(:personal_trainer_profile).permit(:rating, :login_id)
  end
end
