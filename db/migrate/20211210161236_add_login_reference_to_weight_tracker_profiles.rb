class AddLoginReferenceToWeightTrackerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :weight_tracker_profiles, :user_logins, column: :login_id
    add_index :weight_tracker_profiles, :login_id
    change_column_null :weight_tracker_profiles, :login_id, false
  end
end
