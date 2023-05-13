# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get '', to: 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
end
