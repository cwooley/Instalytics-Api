Rails.application.routes.draw do
  root 'application#index'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :pictures
      # get '/login', to: 'auth#create'
    end
  end

end
