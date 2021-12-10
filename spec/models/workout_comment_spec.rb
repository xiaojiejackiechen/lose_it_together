require 'rails_helper'

RSpec.describe WorkoutComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:workout) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
