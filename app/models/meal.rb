class Meal < ApplicationRecord
  enum meal_type: {"breakfast"=>0, "lunch"=>1, "dinner"=>2, "snack"=>3, "other"=>4} 

  # Direct associations

  has_many   :foods,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
