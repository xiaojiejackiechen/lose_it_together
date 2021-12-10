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

end
