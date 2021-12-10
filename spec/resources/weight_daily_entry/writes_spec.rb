require 'rails_helper'

RSpec.describe WeightDailyEntryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'weight_daily_entries',
          attributes: { }
        }
      }
    end

    let(:instance) do
      WeightDailyEntryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { WeightDailyEntry.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:weight_daily_entry) { create(:weight_daily_entry) }

    let(:payload) do
      {
        data: {
          id: weight_daily_entry.id.to_s,
          type: 'weight_daily_entries',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WeightDailyEntryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { weight_daily_entry.reload.updated_at }
      # .and change { weight_daily_entry.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:weight_daily_entry) { create(:weight_daily_entry) }

    let(:instance) do
      WeightDailyEntryResource.find(id: weight_daily_entry.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { WeightDailyEntry.count }.by(-1)
    end
  end
end
