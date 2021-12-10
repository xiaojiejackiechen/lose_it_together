require 'rails_helper'

RSpec.describe Food, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:meal) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
