require "rails_helper"

RSpec.describe "workout_comments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/workout_comments", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "workout_comments",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(WorkoutCommentResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { WorkoutComment.count }.by(1)
    end
  end
end
