class WorkoutComment < ApplicationRecord
  # Direct associations

  belongs_to :workout

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    workout.to_s
  end

end
