class CreateNutritionistProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :nutritionist_profiles do |t|
      t.integer :rating
      t.integer :login_id

      t.timestamps
    end
  end
end
