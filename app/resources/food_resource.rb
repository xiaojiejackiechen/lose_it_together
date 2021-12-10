class FoodResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :meal_id, :integer
  attribute :food_name, :string
  attribute :number_of_gram_consumed, :integer
  attribute :calories_consumed, :integer

  # Direct associations

  belongs_to :meal

  # Indirect associations

  has_one    :user,
             resource: WeightTrackerProfileResource

  filter :weight_tracker_user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:user).where(:meals => {:weight_tracker_user_id => value})
    end
  end
end
