class Api::V1::PersonalTrainerProfilesController < Api::V1::GraphitiController
  def index
    personal_trainer_profiles = PersonalTrainerProfileResource.all(params)
    respond_with(personal_trainer_profiles)
  end

  def show
    personal_trainer_profile = PersonalTrainerProfileResource.find(params)
    respond_with(personal_trainer_profile)
  end

  def create
    personal_trainer_profile = PersonalTrainerProfileResource.build(params)

    if personal_trainer_profile.save
      render jsonapi: personal_trainer_profile, status: :created
    else
      render jsonapi_errors: personal_trainer_profile
    end
  end

  def update
    personal_trainer_profile = PersonalTrainerProfileResource.find(params)

    if personal_trainer_profile.update_attributes
      render jsonapi: personal_trainer_profile
    else
      render jsonapi_errors: personal_trainer_profile
    end
  end

  def destroy
    personal_trainer_profile = PersonalTrainerProfileResource.find(params)

    if personal_trainer_profile.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: personal_trainer_profile
    end
  end
end
