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

end
