Rails.application.routes.draw do
  root to: 'reader#index'

  namespace :api do
    namespace :v1 do
      post '/inputread', to: 'reader#create'
    end
  end

  resources :reader, only: [:index]
end
