require 'rails_helper'

RSpec.describe "nutritionist_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/nutritionist_profiles/#{nutritionist_profile.id}", payload
  end

  describe 'basic update' do
    let!(:nutritionist_profile) { create(:nutritionist_profile) }

    let(:payload) do
      {
        data: {
          id: nutritionist_profile.id.to_s,
          type: 'nutritionist_profiles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(NutritionistProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { nutritionist_profile.reload.attributes }
    end
  end
end
