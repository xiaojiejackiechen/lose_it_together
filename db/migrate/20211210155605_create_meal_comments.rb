class CreateMealComments < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_comments do |t|
      t.integer :meal_id
      t.integer :commenter_user_id
      t.text :comment_text

      t.timestamps
    end
  end
end
