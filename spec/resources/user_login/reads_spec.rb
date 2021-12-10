require "rails_helper"

RSpec.describe UserLoginResource, type: :resource do
  describe "serialization" do
    let!(:user_login) { create(:user_login) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_login.id)
      expect(data.jsonapi_type).to eq("user_logins")
    end
  end

  describe "filtering" do
    let!(:user_login1) { create(:user_login) }
    let!(:user_login2) { create(:user_login) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_login2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_login2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_login1) { create(:user_login) }
      let!(:user_login2) { create(:user_login) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_login1.id,
                                      user_login2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_login2.id,
                                      user_login1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
