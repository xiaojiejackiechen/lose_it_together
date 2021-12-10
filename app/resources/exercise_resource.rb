class ExerciseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :workout_id, :integer
  attribute :excercise_id, :integer
  attribute :number_of_rep, :string
  attribute :calorie_burned, :integer

  # Direct associations

  # Indirect associations

end
