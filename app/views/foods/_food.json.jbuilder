json.extract! food, :id, :meal_id, :food_name, :number_of_gram_consumed,
              :calories_consumed, :created_at, :updated_at
json.url food_url(food, format: :json)
