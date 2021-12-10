require 'rails_helper'

RSpec.describe "weight_tracker_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/weight_tracker_profiles/#{weight_tracker_profile.id}", payload
  end

  describe 'basic update' do
    let!(:weight_tracker_profile) { create(:weight_tracker_profile) }

    let(:payload) do
      {
        data: {
          id: weight_tracker_profile.id.to_s,
          type: 'weight_tracker_profiles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(WeightTrackerProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { weight_tracker_profile.reload.attributes }
    end
  end
end
