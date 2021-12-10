require "rails_helper"

RSpec.describe "weight_tracker_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/weight_tracker_profiles", params: params
  end

  describe "basic fetch" do
    let!(:weight_tracker_profile1) { create(:weight_tracker_profile) }
    let!(:weight_tracker_profile2) { create(:weight_tracker_profile) }

    it "works" do
      expect(WeightTrackerProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["weight_tracker_profiles"])
      expect(d.map(&:id)).to match_array([weight_tracker_profile1.id,
                                          weight_tracker_profile2.id])
    end
  end
end
