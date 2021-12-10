class Meal < ApplicationRecord
  enum meal_type: {"breakfast"=>0, "lunch"=>1, "dinner"=>2, "snack"=>3, "other"=>4} 

  # Direct associations

  belongs_to :calorie_tracker_user,
             :class_name => "WeightTrackerProfile",
             :foreign_key => "weight_tracker_user_id"

  has_many   :meal_comments,
             :dependent => :destroy

  has_many   :foods,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
