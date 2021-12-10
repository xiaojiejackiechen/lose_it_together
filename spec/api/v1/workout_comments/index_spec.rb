require "rails_helper"

RSpec.describe "workout_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/workout_comments", params: params
  end

  describe "basic fetch" do
    let!(:workout_comment1) { create(:workout_comment) }
    let!(:workout_comment2) { create(:workout_comment) }

    it "works" do
      expect(WorkoutCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["workout_comments"])
      expect(d.map(&:id)).to match_array([workout_comment1.id,
                                          workout_comment2.id])
    end
  end
end
