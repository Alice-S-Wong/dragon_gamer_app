Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    # patch "/users/:id" => "users#update"
    get "/users" => "users#show"
    post "/sessions" => "sessions#create"
    get "/games" => "games#index"
    get "/games/:id" => "games#show"
    get "/lists" => "lists#index"
    get "/lists/private" => "lists#private"
    post "/lists" => "lists#create"
    get "/lists/:id" => "lists#show"
    post "/list_items" => "list_items#create"
    delete "/list_items/:id" => "list_items#destroy"
    post "/reviews" => "reviews#create"
    get "/pokemons" => "pokemons#show"
  end
end
