require "rails_helper"

RSpec.describe NutritionistProfile, type: :model do
  describe "Direct Associations" do
    it { should have_many(:weight_tracker) }

    it { should belong_to(:login) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
