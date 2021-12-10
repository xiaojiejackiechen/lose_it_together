class WorkoutComment < ApplicationRecord
  # Direct associations

  belongs_to :user,
             class_name: "UserLogin",
             foreign_key: "commenter_user_id"

  belongs_to :workout

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    workout.to_s
  end
end
