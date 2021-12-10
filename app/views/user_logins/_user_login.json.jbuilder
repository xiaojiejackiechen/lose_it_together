json.extract! user_login, :id, :username, :user_type, :created_at, :updated_at
json.url user_login_url(user_login, format: :json)
json.token user.generate_jwt