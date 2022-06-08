Rails.application.routes.draw do
  devise_for :users
  root to: 'drills#index'

  resources :drills do
    resources :quizzes, only: [:index, :create, :edit, :update, :delete]
    resources :results, only: [:index, :create]
  end
end
