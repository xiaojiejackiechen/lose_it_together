require 'rails_helper'

RSpec.describe "foods#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/foods", params: params
  end

  describe 'basic fetch' do
    let!(:food1) { create(:food) }
    let!(:food2) { create(:food) }

    it 'works' do
      expect(FoodResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['foods'])
      expect(d.map(&:id)).to match_array([food1.id, food2.id])
    end
  end
end
