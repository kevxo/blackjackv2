Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'

      post '/sessions', to: 'sessions#create'
      delete '/sessions/:user_id', to: 'sessions#destroy'

      post '/game_actions', to: 'game_actions#create'
      post '/game_actions/stand', to: 'game_actions#stand'
      patch '/game_actions/:id', to: 'game_actions#update'
    end
  end

  root to: 'home#index'
  get '/game', to: 'game#index'
end
