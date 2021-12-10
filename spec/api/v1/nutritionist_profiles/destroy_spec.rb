require 'rails_helper'

RSpec.describe "nutritionist_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/nutritionist_profiles/#{nutritionist_profile.id}"
  end

  describe 'basic destroy' do
    let!(:nutritionist_profile) { create(:nutritionist_profile) }

    it 'updates the resource' do
      expect(NutritionistProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { NutritionistProfile.count }.by(-1)
      expect { nutritionist_profile.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
