class NutritionistProfile < ApplicationRecord
  # Direct associations

  belongs_to :login,
             :class_name => "UserLogin"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    rating
  end

end
