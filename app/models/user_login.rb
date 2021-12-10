class UserLogin < ApplicationRecord
  enum user_type: {"weight_tracker"=>0, "personal_trainer"=>1, "nutritionist"=>2} 

  # Direct associations

  has_many   :meal_comments,
             :foreign_key => "commenter_user_id",
             :dependent => :destroy

  has_many   :workout_comments,
             :foreign_key => "commenter_user_id",
             :dependent => :destroy

  has_many   :nutritionist_profiles,
             :foreign_key => "login_id",
             :dependent => :destroy

  has_many   :personal_trainer_profiles,
             :foreign_key => "login_id",
             :dependent => :destroy

  has_many   :weight_tracker_profiles,
             :foreign_key => "login_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
