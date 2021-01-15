Rails.application.routes.draw do


  resource :users, only: [:index, :create]
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authorized", to: "auth#user_is_authorized"
  post "/create", to: "stories#create"
  resources :stories
  resources :contributors, only: [:index]
  

  root to: 'application#home'

  put "/image_upload", to: "stories#image_upload"

end
