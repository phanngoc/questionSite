Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  mount ActionCable.server => "/cable"

  devise_for :users, controllers: {sessions: "users/sessions", 
    registrations: "users/registrations", 
    omniauth_callbacks: "callbacks"}

  root to: "home#index"
  
  resources :users do
    resources :follows, only: :create
  end

  resources :topics do
    resources :fotopics, only: :create
  end
  
  resources :answers do
    resources :votes
  end

  resources :questions do
    resources :verques, :protques
    resources :comments, only: :show
    resources :requests
    resources :searchs, only: :index
  end

  resources :verques

  resources :notifies

  resources :comments do
    resources :votes
  end

  namespace :admin do
    root "home#index", path: "/"
    resources :users
    resources :topics
    resources :questions
  end

  resources :chats

  namespace :api do
    root "home#index", path: "/"
    resources :topics do
      get "list_user_follow", path: "users"
      get "push", path: "messages"
    end
  end

end
