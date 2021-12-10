require 'rails_helper'

RSpec.describe NutritionistProfileResource, type: :resource do
  describe 'serialization' do
    let!(:nutritionist_profile) { create(:nutritionist_profile) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(nutritionist_profile.id)
      expect(data.jsonapi_type).to eq('nutritionist_profiles')
    end
  end

  describe 'filtering' do
    let!(:nutritionist_profile1) { create(:nutritionist_profile) }
    let!(:nutritionist_profile2) { create(:nutritionist_profile) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: nutritionist_profile2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([nutritionist_profile2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:nutritionist_profile1) { create(:nutritionist_profile) }
      let!(:nutritionist_profile2) { create(:nutritionist_profile) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            nutritionist_profile1.id,
            nutritionist_profile2.id
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
            nutritionist_profile2.id,
            nutritionist_profile1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
