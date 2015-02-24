Rails.application.routes.draw do
  devise_for :users
  root to: "lift_requests#new"
end
