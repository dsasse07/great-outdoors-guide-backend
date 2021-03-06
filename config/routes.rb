Rails.application.routes.draw do
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/login", to: 'users#login'
  post 'signup', to: 'users#signup'
  get '/me', to: 'users#show'
  patch "/users/:id", to: 'users#update'
  
  delete "images/:signed_id", to: 'visits#destroy_image'

  post "/visits", to: 'visits#create'
  get "visits", to: 'visits#index'
  get "visits/reviews", to: 'visits#reviews'
  patch "visits/:id", to: 'visits#update'
  delete "visits/:id", to: 'visits#destroy'

end
