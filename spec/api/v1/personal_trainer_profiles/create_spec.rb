require 'rails_helper'

RSpec.describe "personal_trainer_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/personal_trainer_profiles", payload
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
          type: 'personal_trainer_profiles',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(PersonalTrainerProfileResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { PersonalTrainerProfile.count }.by(1)
    end
  end
end
