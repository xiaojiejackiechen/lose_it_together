class AddDedicatedPersonalTrainerReferenceToWeightTrackerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :weight_tracker_profiles, :personal_trainer_profiles, column: :associated_personal_trainer_id
    add_index :weight_tracker_profiles, :associated_personal_trainer_id
    change_column_null :weight_tracker_profiles, :associated_personal_trainer_id, false
  end
end
