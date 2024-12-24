Rails.application.routes.draw do
  root "home#index"
  resources :exercises
  devise_for :users
end
