require "rails_helper"

RSpec.describe "personal_trainer_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/personal_trainer_profiles/#{personal_trainer_profile.id}",
                payload
  end

  describe "basic update" do
    let!(:personal_trainer_profile) { create(:personal_trainer_profile) }

    let(:payload) do
      {
        data: {
          id: personal_trainer_profile.id.to_s,
          type: "personal_trainer_profiles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PersonalTrainerProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { personal_trainer_profile.reload.attributes }
    end
  end
end
