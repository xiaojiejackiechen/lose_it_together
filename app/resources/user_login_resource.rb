class UserLoginResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :user_type, :string_enum, allow: UserLogin.user_types.keys

  # Direct associations

  has_many   :personal_trainer_profiles,
             foreign_key: :login_id

  has_many   :weight_tracker_profiles,
             foreign_key: :login_id

  # Indirect associations

end
