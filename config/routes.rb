Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :questions

    # get '/users', to: 'user#index'
  resources :users do
    post '/remove_follow_topic/:id', to: 'users#remove_follow_topic'
    post '/add_follow_topic/:id', to: 'users#add_follow_topic'
  end

  resources :topics
  resources :answers

  resources :comments do
    post '/up_vote/:id', to: 'comments#up_vote'
    post '/remove_vote/:id', to: 'comments#remove_vote'
  end

  get '/search', to: 'home#search'


  namespace :admin do
    root "home#index", path: "/"
    resources :users
    resources :topics
    resources :questions
  end
end
