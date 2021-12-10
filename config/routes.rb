Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :foods

      resources :meals

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "meals#index"
  resources :meal_comments
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
