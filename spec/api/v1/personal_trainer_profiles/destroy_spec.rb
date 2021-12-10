require "rails_helper"

RSpec.describe "personal_trainer_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/personal_trainer_profiles/#{personal_trainer_profile.id}"
  end

  describe "basic destroy" do
    let!(:personal_trainer_profile) { create(:personal_trainer_profile) }

    it "updates the resource" do
      expect(PersonalTrainerProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { PersonalTrainerProfile.count }.by(-1)
      expect { personal_trainer_profile.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
