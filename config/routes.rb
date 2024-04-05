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
  post 'account_recovery/generate_recovery_codes/:user_id', to: 'account_recovery#generate_recovery_codes',
                                                            as: 'account_recovery_generate_recovery_codes'
  post 'account_recovery/use_recovery_code', to: 'account_recovery#use_recovery_code'
  post 'account_recovery/use_security_questions', to: 'account_recovery#use_security_questions'

  get 'account_recovery/load_recovery_partial', to: 'account_recovery#load_recovery_partial'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :view_users, controller: 'users', only: %i[show edit update] do
    get 'hemigrams', on: :member
    resources :hemigrams
    resources :hemigram_dates
  end

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
