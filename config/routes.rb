Rails.application.routes.draw do
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/login", to: "users#login"
  post 'signin', to: 'user#signin'
  get '/me', to: 'users#show'
  patch "/me", to: "users#update"
end
