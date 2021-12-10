require 'rails_helper'

RSpec.describe WorkoutCommentResource, type: :resource do
  describe 'serialization' do
    let!(:workout_comment) { create(:workout_comment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(workout_comment.id)
      expect(data.jsonapi_type).to eq('workout_comments')
    end
  end

  describe 'filtering' do
    let!(:workout_comment1) { create(:workout_comment) }
    let!(:workout_comment2) { create(:workout_comment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: workout_comment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([workout_comment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:workout_comment1) { create(:workout_comment) }
      let!(:workout_comment2) { create(:workout_comment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            workout_comment1.id,
            workout_comment2.id
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
            workout_comment2.id,
            workout_comment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
