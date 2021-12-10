class CreateWeightDailyEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_daily_entries do |t|
      t.integer :weight_tracker_user_id
      t.integer :weight_in_lb
      t.datetime :recorded_date

      t.timestamps
    end
  end
end
