require "rails_helper"

RSpec.describe "weight_tracker_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/weight_tracker_profiles/#{weight_tracker_profile.id}"
  end

  describe "basic destroy" do
    let!(:weight_tracker_profile) { create(:weight_tracker_profile) }

    it "updates the resource" do
      expect(WeightTrackerProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { WeightTrackerProfile.count }.by(-1)
      expect { weight_tracker_profile.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
