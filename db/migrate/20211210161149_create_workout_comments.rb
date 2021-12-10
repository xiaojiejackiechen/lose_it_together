class CreateWorkoutComments < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_comments do |t|
      t.integer :workout_id
      t.integer :commenter_user_id
      t.text :comment_text

      t.timestamps
    end
  end
end
