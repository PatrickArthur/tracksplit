Rails.application.routes.draw do
  post '/purchase/:beat_id', to: 'purchases#create'
  resources :beats, only: [:index, :create]
  post '/auth/signup', to: 'auth#signup'
  post '//login', to: 'auth#login'
end