Rails.application.routes.draw do
  devise_for :users

  resources :lift_requests, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :drivers, only: [:new, :create]

  root to: "lift_requests#index"
end
