# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # root 'users#index'
  # get '', to: 'users#index'

  # devise_for :users
# authenticated :user do

devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  root to: 'users#index'
  get '', to: 'users#index'
# end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
end
