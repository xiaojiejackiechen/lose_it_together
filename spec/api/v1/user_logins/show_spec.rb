require "rails_helper"

RSpec.describe "user_logins#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_logins/#{user_login.id}", params: params
  end

  describe "basic fetch" do
    let!(:user_login) { create(:user_login) }

    it "works" do
      expect(UserLoginResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("user_logins")
      expect(d.id).to eq(user_login.id)
    end
  end
end
