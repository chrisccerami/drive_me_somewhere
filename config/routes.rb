Rails.application.routes.draw do
  devise_for :users
  resources :lift_requests, only: [:new, :create, :show, :edit, :update]
  root to: "lift_requests#new"
end
