Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      post '/users', to: 'users#create'
      get '/feelings', to: 'feelings#index'
    end
  end
end
