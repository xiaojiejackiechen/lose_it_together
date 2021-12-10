require "rails_helper"

RSpec.describe "nutritionist_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/nutritionist_profiles/#{nutritionist_profile.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:nutritionist_profile) { create(:nutritionist_profile) }

    it "works" do
      expect(NutritionistProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("nutritionist_profiles")
      expect(d.id).to eq(nutritionist_profile.id)
    end
  end
end
