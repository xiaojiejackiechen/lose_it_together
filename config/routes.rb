Rails.application.routes.draw do
  resources :workout_comments
  resources :nutritionist_profiles
  devise_for :user_logins
  resources :user_logins
  resources :personal_trainer_profiles
  resources :exercises
  resources :weight_tracker_profiles
  resources :weight_daily_entries
  resources :workouts
  resources :foods
  resources :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
