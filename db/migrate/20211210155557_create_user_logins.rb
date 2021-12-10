class CreateUserLogins < ActiveRecord::Migration[6.0]
  def change
    create_table :user_logins do |t|
      t.string :username
      t.integer :user_type

      t.timestamps
    end
  end
end
