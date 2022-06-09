Rails.application.routes.draw do
  devise_for :users
  root to: 'drills#index'

  resources :drills do
    resources :quizzes, only: [:index, :create, :edit, :update, :destroy]
    resources :results, only: [:index, :create]
  end

  resources :users, only: :show
end
