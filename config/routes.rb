# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :users, only: [] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
