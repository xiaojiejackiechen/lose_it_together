class AddUserReferenceToWorkoutComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :workout_comments, :user_logins, column: :commenter_user_id
    add_index :workout_comments, :commenter_user_id
    change_column_null :workout_comments, :commenter_user_id, false
  end
end
