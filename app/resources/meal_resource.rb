class MealResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :weight_tracker_user_id, :integer
  attribute :date_and_time_of_meal, :datetime
  attribute :meal_type, :string_enum, allow: Meal.meal_types.keys

  # Direct associations

  # Indirect associations

end
