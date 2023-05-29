Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :registrations
  # resources :sessions

  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  # resources :covid_appointments

  get '/appointment', to: 'covid_appointments#new'
  post '/appointment', to: 'covid_appointments#create'
  patch '/appointment/:id', to: 'covid_appointments#update_to_pending', as: 'update_status_to_pending'
  patch '/appointment/:id', to: 'covid_appointments#update_to_negative', as: 'update_status_to_negative'
  patch '/appointment/:id', to: 'covid_appointments#update_to_positive', as: 'update_status_to_positive'

  get 'home', to: 'home#index'
  root 'welcome#index'
end
