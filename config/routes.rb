Rails.application.routes.draw do
  root 'welcome#index'
  get 'about', to: 'pages#about'

  devise_for :users
  resources :view_users, controller: 'users', only: [:show]
end
