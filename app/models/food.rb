class Food < ApplicationRecord
  # Direct associations

  belongs_to :meal

  # Indirect associations

  has_one    :user,
             :through => :meal,
             :source => :calorie_tracker_user

  # Validations

  # Scopes

  def to_s
    meal.to_s
  end

end
