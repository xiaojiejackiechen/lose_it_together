class WeightTrackerProfile < ApplicationRecord
  # Direct associations

  has_many   :weight_daily_entries,
             :foreign_key => "weight_tracker_user_id",
             :dependent => :destroy

  has_many   :meals,
             :foreign_key => "weight_tracker_user_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
