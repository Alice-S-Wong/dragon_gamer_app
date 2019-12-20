Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    # patch "/users/:id" => "users#update"
    post "/sessions" => "sessions#create"
    get "/games" => "games#index"
    get "/games/:id" => "games#show"
    post "/lists" => "lists#create"
    get "/lists/:id" => "lists#show"
    post "/list_items" => "list_items#create"
    delete "/list_items/:id" => "list_items#destroy"
  end
end
