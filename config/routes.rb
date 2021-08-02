Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'

      post '/sessions', to: 'sessions#create'
      delete '/sessions/:user_id', to: 'sessions#destroy'

      post '/cards', to: 'cards#create'
    end
  end

  root to: 'home#index'
  get '/game', to: 'game#index'
end
