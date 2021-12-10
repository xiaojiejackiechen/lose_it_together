require 'rails_helper'

RSpec.describe "foods#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/foods", payload
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
          type: 'foods',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FoodResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Food.count }.by(1)
    end
  end
end
