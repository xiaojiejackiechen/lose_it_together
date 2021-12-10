class AddMealReferenceToFoods < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :foods, :meals
    add_index :foods, :meal_id
    change_column_null :foods, :meal_id, false
  end
end
