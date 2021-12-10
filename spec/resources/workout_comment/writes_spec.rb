require 'rails_helper'

RSpec.describe WorkoutCommentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'workout_comments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      WorkoutCommentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { WorkoutComment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:workout_comment) { create(:workout_comment) }

    let(:payload) do
      {
        data: {
          id: workout_comment.id.to_s,
          type: 'workout_comments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WorkoutCommentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { workout_comment.reload.updated_at }
      # .and change { workout_comment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:workout_comment) { create(:workout_comment) }

    let(:instance) do
      WorkoutCommentResource.find(id: workout_comment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { WorkoutComment.count }.by(-1)
    end
  end
end
