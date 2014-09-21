Rails.application.routes.draw do

  devise_for :users
  # Root of the application => /
  root 'index#index'
end
