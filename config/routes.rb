Rails.application.routes.draw do
  get '/' => 'recipe_ingredients#home'

  get '/pantry' => 'pantry_ingredients#index'
  get '/pantry/new' => 'pantry_ingredients#new'
  post '/pantry' => 'pantry_ingredients#create'
  get '/pantry/:id' => 'pantry_ingredients#show'
  get '/pantry/:id/edit' => 'pantry_ingredients#edit'
  patch '/pantry/:id' => 'pantry_ingredients#update'
  delete '/pantry/:id' => 'pantry_ingredients#destroy'

  get '/recipes' => 'recipe_ingredients#index'
  post '/recipes/:id' => 'recipe_ingredients#create'
  get '/recipes/:id' => 'recipe_ingredients#show'
  delete '/recipes/:id' => 'recipe_ingredients#destroy'

  get '/cookbook' => 'cook_book_recipes#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
