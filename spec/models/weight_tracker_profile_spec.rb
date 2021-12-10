require 'rails_helper'

RSpec.describe WeightTrackerProfile, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:weight_daily_entries) }

    it { should have_many(:meals) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
