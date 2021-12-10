require "rails_helper"

RSpec.describe PersonalTrainerProfile, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:login) }

    it { should have_many(:weight_tracker_profiles) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
