class WeightTrackerProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :target_daily_calories, :integer
  attribute :target_weight_in_lb, :integer
  attribute :profile_pic, :string
  attribute :associated_personal_trainer_id, :integer
  attribute :associated_nutritionist_id, :integer
  attribute :login_id, :integer

  # Direct associations

  # Indirect associations

end