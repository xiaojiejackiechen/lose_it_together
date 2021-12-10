json.extract! workout_comment, :id, :workout_id, :commenter_user_id, :comment_text, :created_at, :updated_at
json.url workout_comment_url(workout_comment, format: :json)
