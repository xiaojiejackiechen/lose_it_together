class CreatePersonalTrainerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_trainer_profiles do |t|
      t.integer :rating
      t.integer :login_id

      t.timestamps
    end
  end
end
