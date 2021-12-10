class PersonalTrainerProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rating, :integer
  attribute :login_id, :integer

  # Direct associations

  belongs_to :login,
             resource: UserLoginResource

  has_many   :weight_tracker_profiles,
             foreign_key: :associated_personal_trainer_id

  # Indirect associations

end
