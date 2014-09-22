Rails.application.routes.draw do

  devise_for :users

  resources :questions

  # Root of the application => /
  root 'index#index'
end
