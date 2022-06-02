Rails.application.routes.draw do
  devise_for :users
  root to: 'drills#index'

  resources :drills, only: [:index, :new, :create, :show] do
    resources :quizzes, only: :create
  end
end
