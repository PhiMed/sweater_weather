Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/login', to: "sessions/login"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :road_trip
      resources :forecast
      resources :backgrounds
      resources :sessions
    end
  end
end
