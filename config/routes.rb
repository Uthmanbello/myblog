# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get '', to: 'users#index'
  post 'users/:user_id/posts/:id/like', to: 'posts#like', as: 'like_user_post'


  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts, only: [:index, :show]
  

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      post 'like', on: :member
    end
  end


  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end 
  
end
