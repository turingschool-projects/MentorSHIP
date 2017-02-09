Rails.application.routes.draw do

  root to: 'site#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :students, only: [:index, :show]
      resources :mentors, only: [:index, :show, :edit, :update]
      get '/session_id', to: 'sessions#session_id'
      get '/user_name', to: 'sessions#user_name'
    end
  end

  resources :mentors, only: [:index, :show]

  get '/about', to: 'about#index'

  resources :dashboard, only: [:edit]
end
