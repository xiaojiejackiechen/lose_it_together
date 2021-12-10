class Api::V1::WeightTrackerProfilesController < Api::V1::GraphitiController
  def index
    weight_tracker_profiles = WeightTrackerProfileResource.all(params)
    respond_with(weight_tracker_profiles)
  end

  def show
    weight_tracker_profile = WeightTrackerProfileResource.find(params)
    respond_with(weight_tracker_profile)
  end

  def create
    weight_tracker_profile = WeightTrackerProfileResource.build(params)

    if weight_tracker_profile.save
      render jsonapi: weight_tracker_profile, status: :created
    else
      render jsonapi_errors: weight_tracker_profile
    end
  end

  def update
    weight_tracker_profile = WeightTrackerProfileResource.find(params)

    if weight_tracker_profile.update_attributes
      render jsonapi: weight_tracker_profile
    else
      render jsonapi_errors: weight_tracker_profile
    end
  end

  def destroy
    weight_tracker_profile = WeightTrackerProfileResource.find(params)

    if weight_tracker_profile.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: weight_tracker_profile
    end
  end
end
