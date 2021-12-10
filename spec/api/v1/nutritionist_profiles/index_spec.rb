require "rails_helper"

RSpec.describe "nutritionist_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/nutritionist_profiles", params: params
  end

  describe "basic fetch" do
    let!(:nutritionist_profile1) { create(:nutritionist_profile) }
    let!(:nutritionist_profile2) { create(:nutritionist_profile) }

    it "works" do
      expect(NutritionistProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["nutritionist_profiles"])
      expect(d.map(&:id)).to match_array([nutritionist_profile1.id,
                                          nutritionist_profile2.id])
    end
  end
end
