class AddUserReferenceToMealComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :meal_comments, :user_logins, column: :commenter_user_id
    add_index :meal_comments, :commenter_user_id
    change_column_null :meal_comments, :commenter_user_id, false
  end
end
