class NutritionistProfilesController < ApplicationController
  before_action :set_nutritionist_profile, only: [:show, :edit, :update, :destroy]

  # GET /nutritionist_profiles
  def index
    @nutritionist_profiles = NutritionistProfile.all
  end

  # GET /nutritionist_profiles/1
  def show
  end

  # GET /nutritionist_profiles/new
  def new
    @nutritionist_profile = NutritionistProfile.new
  end

  # GET /nutritionist_profiles/1/edit
  def edit
  end

  # POST /nutritionist_profiles
  def create
    @nutritionist_profile = NutritionistProfile.new(nutritionist_profile_params)

    if @nutritionist_profile.save
      redirect_to @nutritionist_profile, notice: 'Nutritionist profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /nutritionist_profiles/1
  def update
    if @nutritionist_profile.update(nutritionist_profile_params)
      redirect_to @nutritionist_profile, notice: 'Nutritionist profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /nutritionist_profiles/1
  def destroy
    @nutritionist_profile.destroy
    redirect_to nutritionist_profiles_url, notice: 'Nutritionist profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutritionist_profile
      @nutritionist_profile = NutritionistProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nutritionist_profile_params
      params.require(:nutritionist_profile).permit(:rating, :login_id)
    end
end