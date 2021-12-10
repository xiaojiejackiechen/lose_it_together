class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :weight_tracker_user_id
      t.datetime :date_and_time_of_meal
      t.integer :meal_type

      t.timestamps
    end
  end
end
