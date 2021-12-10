Rails.application.routes.draw do
  resources :exercises
  resources :weight_tracker_profiles
  resources :weight_daily_entries
  resources :workouts
  resources :foods
  resources :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
