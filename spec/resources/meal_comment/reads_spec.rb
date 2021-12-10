require 'rails_helper'

RSpec.describe MealCommentResource, type: :resource do
  describe 'serialization' do
    let!(:meal_comment) { create(:meal_comment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(meal_comment.id)
      expect(data.jsonapi_type).to eq('meal_comments')
    end
  end

  describe 'filtering' do
    let!(:meal_comment1) { create(:meal_comment) }
    let!(:meal_comment2) { create(:meal_comment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: meal_comment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([meal_comment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:meal_comment1) { create(:meal_comment) }
      let!(:meal_comment2) { create(:meal_comment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            meal_comment1.id,
            meal_comment2.id
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
            meal_comment2.id,
            meal_comment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
