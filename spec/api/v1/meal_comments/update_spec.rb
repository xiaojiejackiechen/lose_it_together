require "rails_helper"

RSpec.describe "meal_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/meal_comments/#{meal_comment.id}", payload
  end

  describe "basic update" do
    let!(:meal_comment) { create(:meal_comment) }

    let(:payload) do
      {
        data: {
          id: meal_comment.id.to_s,
          type: "meal_comments",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MealCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { meal_comment.reload.attributes }
    end
  end
end
