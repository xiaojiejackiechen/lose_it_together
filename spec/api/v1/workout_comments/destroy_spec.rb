require "rails_helper"

RSpec.describe "workout_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/workout_comments/#{workout_comment.id}"
  end

  describe "basic destroy" do
    let!(:workout_comment) { create(:workout_comment) }

    it "updates the resource" do
      expect(WorkoutCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { WorkoutComment.count }.by(-1)
      expect { workout_comment.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
