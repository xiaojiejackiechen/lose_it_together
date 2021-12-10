class WeightTrackerProfile < ApplicationRecord
  # Direct associations

  belongs_to :nutritionist,
             :class_name => "NutritionistProfile",
             :foreign_key => "associated_nutritionist_id"

  belongs_to :login,
             :class_name => "UserLogin"

  belongs_to :dedicated_personal_trainer,
             :class_name => "PersonalTrainerProfile",
             :foreign_key => "associated_personal_trainer_id"

  has_many   :workouts,
             :foreign_key => "weight_tracker_user_id",
             :dependent => :destroy

  has_many   :weight_daily_entries,
             :foreign_key => "weight_tracker_user_id",
             :dependent => :destroy

  has_many   :meals,
             :foreign_key => "weight_tracker_user_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :exercises,
             :through => :workouts,
             :source => :exercises

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
