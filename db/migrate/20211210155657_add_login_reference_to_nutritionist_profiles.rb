class AddLoginReferenceToNutritionistProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :nutritionist_profiles, :user_logins, column: :login_id
    add_index :nutritionist_profiles, :login_id
    change_column_null :nutritionist_profiles, :login_id, false
  end
end
