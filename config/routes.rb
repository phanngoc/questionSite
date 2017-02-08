Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :questions

  resources :users do

  end

  post '/users/remove_follow_topic/:id', to: 'users#remove_follow_topic'
  post '/users/add_follow_topic/:id', to: 'users#add_follow_topic'
  post '/users/follow_user/:id', to: 'users#follow_user'
  post '/users/unfollow_user/:id', to: 'users#unfollow_user'

  resources :topics
  
  resources :answers do
    post '/up_vote', to: 'answers#up_vote'
    post '/down_vote', to: 'answers#down_vote'
  end

  resources :comments do
    post '/up_vote', to: 'comments#up_vote'
    post '/remove_vote', to: 'comments#remove_vote'
  end

  get '/search', to: 'home#search'


  namespace :admin do
    root "home#index", path: "/"
    resources :users
    resources :topics
    resources :questions
  end
end
