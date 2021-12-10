require "rails_helper"

RSpec.describe "user_logins#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_logins/#{user_login.id}"
  end

  describe "basic destroy" do
    let!(:user_login) { create(:user_login) }

    it "updates the resource" do
      expect(UserLoginResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UserLogin.count }.by(-1)
      expect { user_login.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
