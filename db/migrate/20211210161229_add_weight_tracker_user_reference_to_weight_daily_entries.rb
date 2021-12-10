class AddWeightTrackerUserReferenceToWeightDailyEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :weight_daily_entries, :weight_tracker_profiles,
                    column: :weight_tracker_user_id
    add_index :weight_daily_entries, :weight_tracker_user_id
    change_column_null :weight_daily_entries, :weight_tracker_user_id, false
  end
end
