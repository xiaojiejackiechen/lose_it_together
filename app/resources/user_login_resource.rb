class UserLoginResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :meal_comments,
             foreign_key: :commenter_user_id

  has_many   :workout_comments,
             foreign_key: :commenter_user_id

  has_many   :nutritionist_profiles,
             foreign_key: :login_id

  has_many   :personal_trainer_profiles,
             foreign_key: :login_id

  has_many   :weight_tracker_profiles,
             foreign_key: :login_id

  # Indirect associations
end
