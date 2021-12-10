require "rails_helper"

RSpec.describe "meal_comments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/meal_comments", payload
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
          type: "meal_comments",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(MealCommentResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { MealComment.count }.by(1)
    end
  end
end
