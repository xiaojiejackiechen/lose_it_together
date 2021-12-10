class MealCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :meal_id, :integer
  attribute :commenter_user_id, :integer
  attribute :comment_text, :string

  # Direct associations

  belongs_to :user,
             resource: UserLoginResource,
             foreign_key: :commenter_user_id

  belongs_to :meal

  # Indirect associations
end
