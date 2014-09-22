Rails.application.routes.draw do

  devise_for  :users

  resources   :questions
  resources   :quizzes

  # Root of the application => /
  root 'index#index'
end
