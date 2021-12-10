class ExerciseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :workout_id, :integer
  attribute :excercise_id, :integer
  attribute :number_of_rep, :string
  attribute :calorie_burned, :integer

  # Direct associations

  belongs_to :workout

  # Indirect associations

  has_one    :user,
             resource: WeightTrackerProfileResource

  filter :weight_tracker_user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:user).where(workouts: { weight_tracker_user_id: value })
    end
  end
end
