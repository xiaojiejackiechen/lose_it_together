require "rails_helper"

RSpec.describe "personal_trainer_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/personal_trainer_profiles/#{personal_trainer_profile.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:personal_trainer_profile) { create(:personal_trainer_profile) }

    it "works" do
      expect(PersonalTrainerProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("personal_trainer_profiles")
      expect(d.id).to eq(personal_trainer_profile.id)
    end
  end
end
