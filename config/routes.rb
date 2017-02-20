Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
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
    resources :verques
  end

  resources :verques

  resources :comments do
    resources :votes
  end

  namespace :admin do
    root "home#index", path: "/"
    resources :users
    resources :topics
    resources :questions
  end
end
