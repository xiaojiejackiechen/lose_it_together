class MealResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :weight_tracker_user_id, :integer
  attribute :date_and_time_of_meal, :datetime
  attribute :meal_type, :string_enum, allow: Meal.meal_types.keys

  # Direct associations

  belongs_to :calorie_tracker_user,
             resource: WeightTrackerProfileResource,
             foreign_key: :weight_tracker_user_id

  has_many   :meal_comments

  has_many   :foods

  # Indirect associations
end
