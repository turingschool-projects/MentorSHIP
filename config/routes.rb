Rails.application.routes.draw do

  root to: 'site#index'

  get 'auth/:provider/callback', to: 'sessions#create'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :students, only: [:index, :show]
      resources :mentors, only: [:index, :show]
      get '/session_id', to: 'sessions#session_id'
      get '/user_name', to: 'sessions#user_name'
    end
  end
end
