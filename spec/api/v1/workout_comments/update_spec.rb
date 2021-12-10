require "rails_helper"

RSpec.describe "workout_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/workout_comments/#{workout_comment.id}", payload
  end

  describe "basic update" do
    let!(:workout_comment) { create(:workout_comment) }

    let(:payload) do
      {
        data: {
          id: workout_comment.id.to_s,
          type: "workout_comments",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(WorkoutCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { workout_comment.reload.attributes }
    end
  end
end
