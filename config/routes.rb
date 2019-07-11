Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :cryptos
      resources :games
      resources :portfolios
      resources :portfolio_values
      resources :purchases
      resources :favorites
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get "/auto_login", to: "auth#auto_login"
    end
  end
end
