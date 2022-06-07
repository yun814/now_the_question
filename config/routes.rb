Rails.application.routes.draw do
  devise_for :users
  root to: 'drills#index'

  resources :drills, only: [:index, :new, :create, :show] do
    resources :quizzes, only: [:index, :create]
    resources :results, only: [:index, :create]
  end
end
