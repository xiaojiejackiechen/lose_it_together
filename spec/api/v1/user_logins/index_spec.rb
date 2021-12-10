require "rails_helper"

RSpec.describe "user_logins#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_logins", params: params
  end

  describe "basic fetch" do
    let!(:user_login1) { create(:user_login) }
    let!(:user_login2) { create(:user_login) }

    it "works" do
      expect(UserLoginResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_logins"])
      expect(d.map(&:id)).to match_array([user_login1.id, user_login2.id])
    end
  end
end
