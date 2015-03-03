Rails.application.routes.draw do
  devise_for :users

  resources :lift_requests, only: [:show, :index, :new, :create,
                                   :edit, :update, :destroy] do
    resources :lifts, only: :create
  end
  resources :lifts, only: [:show, :destroy]
  put "pickup_lift" => "lifts#pickup"
  put "dropoff_lift" => "lifts#dropoff"

  resources :drivers, only: [:show, :new, :create] do
    resources :cars, only: [:new, :create]
  end
  resources :cars, only: :show
  root to: "lift_requests#index"
end
