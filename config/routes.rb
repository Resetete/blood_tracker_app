# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get 'graphs', to: 'graphs#index'
  get 'imprint', to: 'pages#imprint'
  get 'news', to: 'pages#news'
  post '/news/sort_by', to: 'pages#sort_news_articles'
  get 'cookie_policy', to: 'pages#cookie_policy'

  namespace :graphs do
    get 'parameters-per-day', to: 'graphs#parameters_per_day'
  end

  devise_for :users
  resources :view_users, controller: 'users', only: [:show]
  resources :hemigrams

  namespace :admin do
    resources :blood_cell_descriptions
  end
end
