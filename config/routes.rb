Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

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

  post '/send_sms' => 'send_text#trigger_sms_message'

  get '/grocery' => 'grocery_map#grocery_show'
end
