class Workout < ApplicationRecord
  # Direct associations

  has_many   :exercises,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
