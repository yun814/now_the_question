Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root to: 'drills#index'

  resources :drills do
    resources :quizzes, only: [:index, :create, :edit, :update, :destroy]
    resources :results, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :mylists, only: [:create, :show, :destroy] do
      collection do
        post 'add'
      end
    end
    
    member do
      post 'publish'
      get 'genre'
      get 'drill_rank'
    end

    collection do
      get 'search'
      get 'rank'
    end
  end

  resources :users, only: :show do
    collection do
      get 'rank'
    end
  end
end
