Rails.application.routes.draw do
  get '/pantry' => 'pantry_ingredients#index'
  get '/pantry/new' => 'pantry_ingredients#new'
  post '/pantry' => 'pantry_ingredients#create'
  get '/pantry/:id' => 'pantry_ingredients#show'
  get '/pantry/:id/edit' => 'pantry_ingredients#edit'
  patch '/pantry/:id' => 'pantry_ingredients#update'
  delete '/pantry/:id' => 'pantry_ingredients#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
