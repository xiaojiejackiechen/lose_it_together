class AddCalorieTrackerUserReferenceToMeals < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :meals, :weight_tracker_profiles, column: :weight_tracker_user_id
    add_index :meals, :weight_tracker_user_id
    change_column_null :meals, :weight_tracker_user_id, false
  end
end
