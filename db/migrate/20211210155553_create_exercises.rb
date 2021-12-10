class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :excercise_id
      t.string :number_of_rep
      t.integer :calorie_burned

      t.timestamps
    end
  end
end
