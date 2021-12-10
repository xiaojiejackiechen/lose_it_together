require 'rails_helper'

RSpec.describe PersonalTrainerProfileResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'personal_trainer_profiles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PersonalTrainerProfileResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PersonalTrainerProfile.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:personal_trainer_profile) { create(:personal_trainer_profile) }

    let(:payload) do
      {
        data: {
          id: personal_trainer_profile.id.to_s,
          type: 'personal_trainer_profiles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PersonalTrainerProfileResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { personal_trainer_profile.reload.updated_at }
      # .and change { personal_trainer_profile.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:personal_trainer_profile) { create(:personal_trainer_profile) }

    let(:instance) do
      PersonalTrainerProfileResource.find(id: personal_trainer_profile.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PersonalTrainerProfile.count }.by(-1)
    end
  end
end
