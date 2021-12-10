require 'rails_helper'

RSpec.describe "foods#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/foods/#{food.id}"
  end

  describe 'basic destroy' do
    let!(:food) { create(:food) }

    it 'updates the resource' do
      expect(FoodResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Food.count }.by(-1)
      expect { food.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
