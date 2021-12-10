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

  belongs_to :nutritionist,
             resource: NutritionistProfileResource,
             foreign_key: :associated_nutritionist_id

  belongs_to :login,
             resource: UserLoginResource

  belongs_to :dedicated_personal_trainer,
             resource: PersonalTrainerProfileResource,
             foreign_key: :associated_personal_trainer_id

  has_many   :workouts,
             foreign_key: :weight_tracker_user_id

  has_many   :weight_daily_entries,
             foreign_key: :weight_tracker_user_id

  has_many   :meals,
             foreign_key: :weight_tracker_user_id

  # Indirect associations

  has_many :foods do
    assign_each do |weight_tracker_profile, foods|
      foods.select do |f|
        f.id.in?(weight_tracker_profile.foods.map(&:id))
      end
    end
  end

  has_many :exercises do
    assign_each do |weight_tracker_profile, exercises|
      exercises.select do |e|
        e.id.in?(weight_tracker_profile.exercises.map(&:id))
      end
    end
  end
end
