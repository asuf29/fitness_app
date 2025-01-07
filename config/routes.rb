Rails.application.routes.draw do
  root "home#index"

  resources :exercises
  devise_for :users
  resources :profiles
  resources :workouts
  resources :articles do
    resources :comments, controller: "articles/comments" do
      post "like", on: :member
    end
  end

  namespace :api do
    resources :exercises
    resources :workouts
  end
end
