json.extract! workout, :id, :workout_date, :weight_tracker_user_id, :created_at, :updated_at
json.url workout_url(workout, format: :json)
