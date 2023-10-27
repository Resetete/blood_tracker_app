# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get 'graphs', to: 'graphs#index'
  get 'imprint', to: 'pages#imprint'
  get 'news', to: 'pages#news'
  post '/news/sort_by', to: 'pages#sort_news_articles'
  get 'cookie_policy', to: 'pages#cookie_policy'
  get '/hemigrams/get_unit_selection_dropdown_options', to: 'hemigrams#get_unit_selection_dropdown_options'

  devise_for :users
  resources :view_users, controller: 'users', only: [:show]
  resources :hemigrams, param: :parameter

  namespace :admin do
    resources :blood_cell_descriptions
  end
end
