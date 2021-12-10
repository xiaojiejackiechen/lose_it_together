require 'rails_helper'

RSpec.describe "foods#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/foods/#{food.id}", payload
  end

  describe 'basic update' do
    let!(:food) { create(:food) }

    let(:payload) do
      {
        data: {
          id: food.id.to_s,
          type: 'foods',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FoodResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { food.reload.attributes }
    end
  end
end
