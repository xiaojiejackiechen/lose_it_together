class AddWeightTrackerUserReferenceToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :workouts, :weight_tracker_profiles,
                    column: :weight_tracker_user_id
    add_index :workouts, :weight_tracker_user_id
    change_column_null :workouts, :weight_tracker_user_id, false
  end
end
