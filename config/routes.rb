Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :questions

    # get '/users', to: 'user#index'
  resources :users
  resources :topics
  resources :answers

  resources :comments

  post '/comments/up_vote/:id', to: 'comments#up_vote'
  post '/comments/remove_vote/:id', to: 'comments#remove_vote'
  post '/users/remove_follow_topic/:id', to: 'users#remove_follow_topic'
  post '/users/add_follow_topic/:id', to: 'users#add_follow_topic'


  namespace :admin do
    root "admin/home#index", path: "/"
    resources :users
    resources :topics
  end
end
