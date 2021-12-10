json.extract! nutritionist_profile, :id, :rating, :login_id, :created_at, :updated_at
json.url nutritionist_profile_url(nutritionist_profile, format: :json)
