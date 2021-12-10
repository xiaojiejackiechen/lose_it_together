require 'rails_helper'

RSpec.describe "workout_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/workout_comments/#{workout_comment.id}", params: params
  end

  describe 'basic fetch' do
    let!(:workout_comment) { create(:workout_comment) }

    it 'works' do
      expect(WorkoutCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('workout_comments')
      expect(d.id).to eq(workout_comment.id)
    end
  end
end
