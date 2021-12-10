class UserLogin < ApplicationRecord
  enum user_type: {"weight_tracker"=>0, "personal_trainer"=>1, "nutritionist"=>2} 

  # Direct associations

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
