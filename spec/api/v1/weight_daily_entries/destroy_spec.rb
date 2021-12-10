require 'rails_helper'

RSpec.describe "weight_daily_entries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/weight_daily_entries/#{weight_daily_entry.id}"
  end

  describe 'basic destroy' do
    let!(:weight_daily_entry) { create(:weight_daily_entry) }

    it 'updates the resource' do
      expect(WeightDailyEntryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { WeightDailyEntry.count }.by(-1)
      expect { weight_daily_entry.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
