class WeightDailyEntry < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    weight_tracker_user.to_s
  end

end
