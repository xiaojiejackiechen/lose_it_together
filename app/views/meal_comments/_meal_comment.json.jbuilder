json.extract! meal_comment, :id, :meal_id, :commenter_user_id, :comment_text, :created_at, :updated_at
json.url meal_comment_url(meal_comment, format: :json)
