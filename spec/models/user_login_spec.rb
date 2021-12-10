require 'rails_helper'

RSpec.describe UserLogin, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:personal_trainer_profiles) }

    it { should have_many(:weight_tracker_profiles) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
