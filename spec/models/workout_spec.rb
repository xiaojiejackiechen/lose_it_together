require 'rails_helper'

RSpec.describe Workout, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:exercises) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
