require 'rails_helper'

RSpec.describe Exercise, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:workout) }

    end

    describe "InDirect Associations" do

    it { should have_one(:user) }

    end

    describe "Validations" do

    end
end
