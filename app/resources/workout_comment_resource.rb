class WorkoutCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :workout_id, :integer
  attribute :commenter_user_id, :integer
  attribute :comment_text, :string

  # Direct associations

  # Indirect associations

end