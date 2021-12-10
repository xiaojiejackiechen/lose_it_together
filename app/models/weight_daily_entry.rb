class WeightDailyEntry < ApplicationRecord
  # Direct associations

  belongs_to :weight_tracker_user,
             class_name: "WeightTrackerProfile"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    weight_tracker_user.to_s
  end
end
