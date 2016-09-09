Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :students, only: [:index, :show]
      resources :mentors, only: [:index, :show]
    end
  end
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "/start_auth", to: 'github#github_start'
end
