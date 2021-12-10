class Exercise < ApplicationRecord
  # Direct associations

  belongs_to :workout

  # Indirect associations

  has_one    :user,
             through: :workout,
             source: :weight_tracker_user

  # Validations

  # Scopes

  def to_s
    workout.to_s
  end
end
