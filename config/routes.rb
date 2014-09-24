Rails.application.routes.draw do

  devise_for  :users

  resources   :questions
  resources   :quizzes
  resources   :quiz_questions do
    get 'set_as_correct', on: :member
    get 'set_as_incorrect', on: :member
  end
  resources   :organizations

  get '/thanks', to: 'index#thanks'

  # Root of the application => /
  root 'index#index'
end
