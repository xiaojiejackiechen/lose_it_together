require "rails_helper"

RSpec.describe "meal_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/meal_comments", params: params
  end

  describe "basic fetch" do
    let!(:meal_comment1) { create(:meal_comment) }
    let!(:meal_comment2) { create(:meal_comment) }

    it "works" do
      expect(MealCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["meal_comments"])
      expect(d.map(&:id)).to match_array([meal_comment1.id, meal_comment2.id])
    end
  end
end
