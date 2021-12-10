class NutritionistProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rating, :integer
  attribute :login_id, :integer

  # Direct associations

  has_many   :weight_tracker,
             resource: WeightTrackerProfileResource,
             foreign_key: :associated_nutritionist_id

  belongs_to :login,
             resource: UserLoginResource

  # Indirect associations

end
