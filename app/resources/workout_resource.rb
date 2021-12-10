class WorkoutResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :workout_date, :date
  attribute :weight_tracker_user_id, :integer

  # Direct associations

  has_many   :exercises

  # Indirect associations

end
