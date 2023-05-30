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

  # appointment
  get '/appointment', to: 'covid_appointments#new'
  post '/appointment', to: 'covid_appointments#create'
  patch '/appointment/:id/pending', to: 'covid_appointments#update_status_to_pending', as: 'update_status_to_pending'
  patch '/appointment/:id/negative', to: 'covid_appointments#update_status_to_negative', as: 'update_status_to_negative'
  patch '/appointment/:id/positive', to: 'covid_appointments#update_status_to_positive', as: 'update_status_to_positive'

  # edit user info
  get '/user', to: 'user#index', as: 'user'
  get '/user/:id/edit', to: 'user#edit', as: 'edit_user'
  patch '/user/:id/', to: 'user#update', as: 'edit_user_update'
  # change password
  get '/user/:id/edit_password', to:'user#edit_password', as: 'edit_password'
  post '/user/:id/edit_password', to: 'user#change_password', as: 'change_password'


  get 'home', to: 'home#index'
  root 'welcome#index'
end
