json.extract! weight_daily_entry, :id, :weight_tracker_user_id, :weight_in_lb,
              :recorded_date, :created_at, :updated_at
json.url weight_daily_entry_url(weight_daily_entry, format: :json)
