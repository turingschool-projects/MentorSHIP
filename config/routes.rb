Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :students, only: [:index, :show]
      resources :mentors, only: [:index, :show]
      get '/session_id', to: 'sessions#session_id'
      get '/user_name', to: 'sessions#user_name'
    end
  end

  resources :mentors, only: [:index]
  root to: 'site#index'
end
