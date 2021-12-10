class WorkoutResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :workout_date, :date
  attribute :weight_tracker_user_id, :integer

  # Direct associations

  belongs_to :weight_tracker_user,
             resource: WeightTrackerProfileResource

  has_many   :workout_comments

  has_many   :exercises

  # Indirect associations

end
