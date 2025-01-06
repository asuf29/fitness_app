Rails.application.routes.draw do
  root "home#index"

  resources :exercises
  devise_for :users
  resources :profiles
  resources :workouts
  resources :articles

  namespace :api do
    resources :exercises
    resources :workouts
  end
end
