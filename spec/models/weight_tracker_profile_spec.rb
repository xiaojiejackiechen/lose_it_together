require 'rails_helper'

RSpec.describe WeightTrackerProfile, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:nutritionist) }

    it { should belong_to(:login) }

    it { should belong_to(:dedicated_personal_trainer) }

    it { should have_many(:workouts) }

    it { should have_many(:weight_daily_entries) }

    it { should have_many(:meals) }

    end

    describe "InDirect Associations" do

    it { should have_many(:exercises) }

    end

    describe "Validations" do

    end
end
