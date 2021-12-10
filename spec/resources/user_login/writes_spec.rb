require "rails_helper"

RSpec.describe UserLoginResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "user_logins",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UserLoginResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UserLogin.count }.by(1)
    end
  end

  describe "updating" do
    let!(:user_login) { create(:user_login) }

    let(:payload) do
      {
        data: {
          id: user_login.id.to_s,
          type: "user_logins",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UserLoginResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { user_login.reload.updated_at }
      # .and change { user_login.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:user_login) { create(:user_login) }

    let(:instance) do
      UserLoginResource.find(id: user_login.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UserLogin.count }.by(-1)
    end
  end
end
