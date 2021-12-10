class AddWorkoutReferenceToWorkoutComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :workout_comments, :workouts
    add_index :workout_comments, :workout_id
    change_column_null :workout_comments, :workout_id, false
  end
end
