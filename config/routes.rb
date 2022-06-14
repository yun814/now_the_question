Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root to: 'drills#index'

  resources :drills do
    resources :quizzes, only: [:index, :create, :edit, :update, :destroy]
    resources :results, only: [:index, :create]
    
    member do
      post 'publish'
    end

    collection do
      get 'search'
      get 'genre'
    end
  end

  resources :users, only: :show
end
