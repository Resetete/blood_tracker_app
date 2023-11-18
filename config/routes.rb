# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get 'graphs', to: 'graphs#index'
  get 'imprint', to: 'pages#imprint'
  get 'glossary', to: 'glossaries#glossary'
  get 'news', to: 'pages#news'
  post '/news/sort_by', to: 'pages#sort_news_articles'
  get 'cookie_policy', to: 'pages#cookie_policy'
  get '/hemigrams/get_unit_selection_dropdown_options', to: 'hemigrams#get_unit_selection_dropdown_options'
  post 'account_recovery/generate_recovery_codes/:user_id', to: 'account_recovery#generate_recovery_codes', as: 'account_recovery_generate_recovery_codes'
  post 'account_recovery/use_recovery_code', to: 'account_recovery#use_recovery_code'

  devise_for :users

  resources :view_users, controller: 'users', only: [:show]
  resources :hemigrams

  namespace :hemigrams do
    resources :chart_settings
  end

  namespace :admin do
    resources :blood_cell_descriptions
    namespace :hemigrams do
      resources :parameter_metadata
    end
  end
end
