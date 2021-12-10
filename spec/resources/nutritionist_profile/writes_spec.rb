require 'rails_helper'

RSpec.describe NutritionistProfileResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'nutritionist_profiles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NutritionistProfileResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { NutritionistProfile.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:nutritionist_profile) { create(:nutritionist_profile) }

    let(:payload) do
      {
        data: {
          id: nutritionist_profile.id.to_s,
          type: 'nutritionist_profiles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NutritionistProfileResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { nutritionist_profile.reload.updated_at }
      # .and change { nutritionist_profile.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:nutritionist_profile) { create(:nutritionist_profile) }

    let(:instance) do
      NutritionistProfileResource.find(id: nutritionist_profile.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { NutritionistProfile.count }.by(-1)
    end
  end
end