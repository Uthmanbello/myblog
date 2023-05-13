# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get '', to: 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end 
end
