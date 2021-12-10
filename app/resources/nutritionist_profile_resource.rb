class NutritionistProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rating, :integer
  attribute :login_id, :integer

  # Direct associations

  belongs_to :login,
             resource: UserLoginResource

  # Indirect associations

end
