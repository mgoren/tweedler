Rails.application.routes.draw do
  devise_for :users
  root to: "tweeds#index"

  resources :users

  resources :tweeds

end
