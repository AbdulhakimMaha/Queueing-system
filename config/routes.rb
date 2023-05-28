Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :registrations 
  # resources :sessions 

  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  root 'home#index'
end
