class Api::V1::NutritionistProfilesController < Api::V1::GraphitiController
  def index
    nutritionist_profiles = NutritionistProfileResource.all(params)
    respond_with(nutritionist_profiles)
  end

  def show
    nutritionist_profile = NutritionistProfileResource.find(params)
    respond_with(nutritionist_profile)
  end

  def create
    nutritionist_profile = NutritionistProfileResource.build(params)

    if nutritionist_profile.save
      render jsonapi: nutritionist_profile, status: 201
    else
      render jsonapi_errors: nutritionist_profile
    end
  end

  def update
    nutritionist_profile = NutritionistProfileResource.find(params)

    if nutritionist_profile.update_attributes
      render jsonapi: nutritionist_profile
    else
      render jsonapi_errors: nutritionist_profile
    end
  end

  def destroy
    nutritionist_profile = NutritionistProfileResource.find(params)

    if nutritionist_profile.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: nutritionist_profile
    end
  end
end
