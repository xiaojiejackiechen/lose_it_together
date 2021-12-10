require 'rails_helper'

RSpec.describe "personal_trainer_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/personal_trainer_profiles", params: params
  end

  describe 'basic fetch' do
    let!(:personal_trainer_profile1) { create(:personal_trainer_profile) }
    let!(:personal_trainer_profile2) { create(:personal_trainer_profile) }

    it 'works' do
      expect(PersonalTrainerProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['personal_trainer_profiles'])
      expect(d.map(&:id)).to match_array([personal_trainer_profile1.id, personal_trainer_profile2.id])
    end
  end
end
