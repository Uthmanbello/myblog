# frozen_string_literal: true

Rails.application.routes.draw do
  get '', to: 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
