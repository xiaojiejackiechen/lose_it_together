json.extract! meal, :id, :weight_tracker_user_id, :date_and_time_of_meal,
              :meal_type, :created_at, :updated_at
json.url meal_url(meal, format: :json)
