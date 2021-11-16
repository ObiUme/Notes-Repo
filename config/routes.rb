Rails.application.routes.draw do
  resources :notes
  resources :users

  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  
  get "/hello", to: "application#hello_world"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
