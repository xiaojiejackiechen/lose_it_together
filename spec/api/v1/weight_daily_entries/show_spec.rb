require "rails_helper"

RSpec.describe "weight_daily_entries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/weight_daily_entries/#{weight_daily_entry.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:weight_daily_entry) { create(:weight_daily_entry) }

    it "works" do
      expect(WeightDailyEntryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("weight_daily_entries")
      expect(d.id).to eq(weight_daily_entry.id)
    end
  end
end
