require 'rails_helper'

RSpec.describe FoodResource, type: :resource do
  describe 'serialization' do
    let!(:food) { create(:food) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(food.id)
      expect(data.jsonapi_type).to eq('foods')
    end
  end

  describe 'filtering' do
    let!(:food1) { create(:food) }
    let!(:food2) { create(:food) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: food2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([food2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:food1) { create(:food) }
      let!(:food2) { create(:food) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            food1.id,
            food2.id
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
            food2.id,
            food1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
