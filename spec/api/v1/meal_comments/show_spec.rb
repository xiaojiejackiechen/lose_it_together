require "rails_helper"

RSpec.describe "meal_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/meal_comments/#{meal_comment.id}", params: params
  end

  describe "basic fetch" do
    let!(:meal_comment) { create(:meal_comment) }

    it "works" do
      expect(MealCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("meal_comments")
      expect(d.id).to eq(meal_comment.id)
    end
  end
end
