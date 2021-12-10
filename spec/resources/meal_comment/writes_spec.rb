require "rails_helper"

RSpec.describe MealCommentResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "meal_comments",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MealCommentResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { MealComment.count }.by(1)
    end
  end

  describe "updating" do
    let!(:meal_comment) { create(:meal_comment) }

    let(:payload) do
      {
        data: {
          id: meal_comment.id.to_s,
          type: "meal_comments",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MealCommentResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { meal_comment.reload.updated_at }
      # .and change { meal_comment.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:meal_comment) { create(:meal_comment) }

    let(:instance) do
      MealCommentResource.find(id: meal_comment.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { MealComment.count }.by(-1)
    end
  end
end
