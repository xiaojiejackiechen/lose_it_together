class MealComment < ApplicationRecord
  # Direct associations

  belongs_to :user,
             class_name: "UserLogin",
             foreign_key: "commenter_user_id"

  belongs_to :meal

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    meal.to_s
  end
end
