class NutritionistProfile < ApplicationRecord
  # Direct associations

  has_many   :weight_tracker,
             class_name: "WeightTrackerProfile",
             foreign_key: "associated_nutritionist_id",
             dependent: :destroy

  belongs_to :login,
             class_name: "UserLogin"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    rating
  end
end
