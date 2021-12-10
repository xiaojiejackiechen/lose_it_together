require 'rails_helper'

RSpec.describe WeightTrackerProfileResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'weight_tracker_profiles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      WeightTrackerProfileResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { WeightTrackerProfile.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:weight_tracker_profile) { create(:weight_tracker_profile) }

    let(:payload) do
      {
        data: {
          id: weight_tracker_profile.id.to_s,
          type: 'weight_tracker_profiles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WeightTrackerProfileResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { weight_tracker_profile.reload.updated_at }
      # .and change { weight_tracker_profile.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:weight_tracker_profile) { create(:weight_tracker_profile) }

    let(:instance) do
      WeightTrackerProfileResource.find(id: weight_tracker_profile.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { WeightTrackerProfile.count }.by(-1)
    end
  end
end