require 'rails_helper'

RSpec.describe Meal, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:foods) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
