class WeightDailyEntryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :weight_tracker_user_id, :integer
  attribute :weight_in_lb, :integer
  attribute :recorded_date, :datetime

  # Direct associations

  belongs_to :weight_tracker_user,
             resource: WeightTrackerProfileResource

  # Indirect associations
end
