Rails.application.routes.draw do
  root 'application#index'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :pictures
      get '/users/:id/pictures', to: 'users#pictures'
    end
  end

end
