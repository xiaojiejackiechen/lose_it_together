class MealComment < ApplicationRecord
  # Direct associations

  belongs_to :meal

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    meal.to_s
  end

end
