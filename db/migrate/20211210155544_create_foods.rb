class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.integer :meal_id
      t.string :food_name
      t.integer :number_of_gram_consumed
      t.integer :calories_consumed

      t.timestamps
    end
  end
end
