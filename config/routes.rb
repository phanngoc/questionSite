Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
  end


  resources :comments do
  end

  namespace :admin do
    root "home#index", path: "/"
    resources :users
    resources :topics
    resources :questions
  end
end
