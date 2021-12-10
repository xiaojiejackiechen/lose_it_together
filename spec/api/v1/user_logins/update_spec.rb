require "rails_helper"

RSpec.describe "user_logins#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_logins/#{user_login.id}", payload
  end

  describe "basic update" do
    let!(:user_login) { create(:user_login) }

    let(:payload) do
      {
        data: {
          id: user_login.id.to_s,
          type: "user_logins",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserLoginResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_login.reload.attributes }
    end
  end
end
