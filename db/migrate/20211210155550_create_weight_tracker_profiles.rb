class CreateWeightTrackerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_tracker_profiles do |t|
      t.string :username
      t.integer :target_daily_calories
      t.integer :target_weight_in_lb
      t.string :profile_pic
      t.integer :associated_personal_trainer_id
      t.integer :associated_nutritionist_id
      t.integer :login_id

      t.timestamps
    end
  end
end
