require 'rails_helper'

RSpec.describe "foods#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/foods/#{food.id}", params: params
  end

  describe 'basic fetch' do
    let!(:food) { create(:food) }

    it 'works' do
      expect(FoodResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('foods')
      expect(d.id).to eq(food.id)
    end
  end
end
