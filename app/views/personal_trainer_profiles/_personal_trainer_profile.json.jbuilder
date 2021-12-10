json.extract! personal_trainer_profile, :id, :rating, :login_id, :created_at,
              :updated_at
json.url personal_trainer_profile_url(personal_trainer_profile, format: :json)
