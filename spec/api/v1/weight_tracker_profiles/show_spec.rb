require 'rails_helper'

RSpec.describe "weight_tracker_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/weight_tracker_profiles/#{weight_tracker_profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:weight_tracker_profile) { create(:weight_tracker_profile) }

    it 'works' do
      expect(WeightTrackerProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('weight_tracker_profiles')
      expect(d.id).to eq(weight_tracker_profile.id)
    end
  end
end
