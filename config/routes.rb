Rails.application.routes.draw do
  devise_for :users
  resources :lift_requests, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  root to: "lift_requests#index"
end
