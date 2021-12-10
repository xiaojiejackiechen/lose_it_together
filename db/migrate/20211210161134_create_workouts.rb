class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.date :workout_date
      t.integer :weight_tracker_user_id

      t.timestamps
    end
  end
end
