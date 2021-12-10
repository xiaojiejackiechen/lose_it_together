json.extract! weight_tracker_profile, :id, :username, :target_daily_calories, :target_weight_in_lb, :profile_pic, :associated_personal_trainer_id, :associated_nutritionist_id, :login_id, :created_at, :updated_at
json.url weight_tracker_profile_url(weight_tracker_profile, format: :json)
