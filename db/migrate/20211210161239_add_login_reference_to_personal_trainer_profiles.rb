class AddLoginReferenceToPersonalTrainerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :personal_trainer_profiles, :user_logins, column: :login_id
    add_index :personal_trainer_profiles, :login_id
    change_column_null :personal_trainer_profiles, :login_id, false
  end
end
