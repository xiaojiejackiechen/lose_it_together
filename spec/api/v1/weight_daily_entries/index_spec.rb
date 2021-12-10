require 'rails_helper'

RSpec.describe "weight_daily_entries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/weight_daily_entries", params: params
  end

  describe 'basic fetch' do
    let!(:weight_daily_entry1) { create(:weight_daily_entry) }
    let!(:weight_daily_entry2) { create(:weight_daily_entry) }

    it 'works' do
      expect(WeightDailyEntryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['weight_daily_entries'])
      expect(d.map(&:id)).to match_array([weight_daily_entry1.id, weight_daily_entry2.id])
    end
  end
end
