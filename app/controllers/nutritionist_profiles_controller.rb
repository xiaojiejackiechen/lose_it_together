class NutritionistProfilesController < ApplicationController
  before_action :set_nutritionist_profile,
                only: %i[show edit update destroy]

  def index
    @q = NutritionistProfile.ransack(params[:q])
    @nutritionist_profiles = @q.result(distinct: true).includes(:login,
                                                                :weight_tracker).page(params[:page]).per(10)
  end

  def show
    @weight_tracker_profile = WeightTrackerProfile.new
  end

  def new
    @nutritionist_profile = NutritionistProfile.new
  end

  def edit; end

  def create
    @nutritionist_profile = NutritionistProfile.new(nutritionist_profile_params)

    if @nutritionist_profile.save
      message = "NutritionistProfile was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @nutritionist_profile, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @nutritionist_profile.update(nutritionist_profile_params)
      redirect_to @nutritionist_profile,
                  notice: "Nutritionist profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @nutritionist_profile.destroy
    message = "NutritionistProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to nutritionist_profiles_url, notice: message
    end
  end

  private

  def set_nutritionist_profile
    @nutritionist_profile = NutritionistProfile.find(params[:id])
  end

  def nutritionist_profile_params
    params.require(:nutritionist_profile).permit(:rating, :login_id)
  end
end
