Rails.application.routes.draw do

  resources :stories

  root to: 'application#home'

end
