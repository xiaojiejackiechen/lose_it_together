require 'rails_helper'

RSpec.describe PersonalTrainerProfileResource, type: :resource do
  describe 'serialization' do
    let!(:personal_trainer_profile) { create(:personal_trainer_profile) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(personal_trainer_profile.id)
      expect(data.jsonapi_type).to eq('personal_trainer_profiles')
    end
  end

  describe 'filtering' do
    let!(:personal_trainer_profile1) { create(:personal_trainer_profile) }
    let!(:personal_trainer_profile2) { create(:personal_trainer_profile) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: personal_trainer_profile2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([personal_trainer_profile2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:personal_trainer_profile1) { create(:personal_trainer_profile) }
      let!(:personal_trainer_profile2) { create(:personal_trainer_profile) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            personal_trainer_profile1.id,
            personal_trainer_profile2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            personal_trainer_profile2.id,
            personal_trainer_profile1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
