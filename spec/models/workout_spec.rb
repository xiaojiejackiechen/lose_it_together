require 'rails_helper'

RSpec.describe Workout, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:weight_tracker_user) }

    it { should have_many(:workout_comments) }

    it { should have_many(:exercises) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
