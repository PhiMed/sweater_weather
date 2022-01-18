Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/login', to: "sessions/login"

  namespace :api do
    namespace :v1 do
      get '/users', to: "users#show"

      post '/users', to: "users#create"

      post 'sessions', to: "sessions#create"

      post '/road_trip', to: "roadtrips#create"

      get '/forecast', to: "forecast#show"

      get '/backgrounds', to: "backgrounds#show"

      get '/book-search', to: "booksearch#search"


    end
  end
end
