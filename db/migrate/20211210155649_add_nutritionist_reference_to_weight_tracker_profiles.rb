class AddNutritionistReferenceToWeightTrackerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :weight_tracker_profiles, :nutritionist_profiles,
                    column: :associated_nutritionist_id
    add_index :weight_tracker_profiles, :associated_nutritionist_id
    change_column_null :weight_tracker_profiles, :associated_nutritionist_id,
                       false
  end
end
