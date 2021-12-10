require 'rails_helper'

RSpec.describe "weight_daily_entries#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/weight_daily_entries", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'weight_daily_entries',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(WeightDailyEntryResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { WeightDailyEntry.count }.by(1)
    end
  end
end
