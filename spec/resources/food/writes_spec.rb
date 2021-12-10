require "rails_helper"

RSpec.describe FoodResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "foods",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FoodResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Food.count }.by(1)
    end
  end

  describe "updating" do
    let!(:food) { create(:food) }

    let(:payload) do
      {
        data: {
          id: food.id.to_s,
          type: "foods",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FoodResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { food.reload.updated_at }
      # .and change { food.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:food) { create(:food) }

    let(:instance) do
      FoodResource.find(id: food.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Food.count }.by(-1)
    end
  end
end
