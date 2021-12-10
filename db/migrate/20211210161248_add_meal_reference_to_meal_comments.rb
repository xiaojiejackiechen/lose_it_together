class AddMealReferenceToMealComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :meal_comments, :meals
    add_index :meal_comments, :meal_id
    change_column_null :meal_comments, :meal_id, false
  end
end
