require "rails_helper"

RSpec.describe "meal_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/meal_comments/#{meal_comment.id}"
  end

  describe "basic destroy" do
    let!(:meal_comment) { create(:meal_comment) }

    it "updates the resource" do
      expect(MealCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { MealComment.count }.by(-1)
      expect { meal_comment.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
