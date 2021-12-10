require "rails_helper"

RSpec.describe "weight_daily_entries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/weight_daily_entries/#{weight_daily_entry.id}", payload
  end

  describe "basic update" do
    let!(:weight_daily_entry) { create(:weight_daily_entry) }

    let(:payload) do
      {
        data: {
          id: weight_daily_entry.id.to_s,
          type: "weight_daily_entries",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(WeightDailyEntryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { weight_daily_entry.reload.attributes }
    end
  end
end
