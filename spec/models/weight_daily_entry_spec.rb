require "rails_helper"

RSpec.describe WeightDailyEntry, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:weight_tracker_user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
