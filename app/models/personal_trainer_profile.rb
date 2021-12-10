class PersonalTrainerProfile < ApplicationRecord
  # Direct associations

  belongs_to :login,
             class_name: "UserLogin"

  has_many   :weight_tracker_profiles,
             foreign_key: "associated_personal_trainer_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    rating
  end
end
