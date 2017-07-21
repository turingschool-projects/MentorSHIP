Rails.application.routes.draw do

  root to: 'site#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :mentors, only: [:index, :show, :edit, :update]
    end
  end

  resources :mentors, only: [:index, :show, :new, :create]

  get '/about', to: 'about#index'

  resources :dashboard, only: [:edit]
end
