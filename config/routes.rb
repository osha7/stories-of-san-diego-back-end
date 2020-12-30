Rails.application.routes.draw do

  resources :users
  resources :stories

  root to: 'application#home'

end
