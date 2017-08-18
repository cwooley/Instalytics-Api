Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :pictures
      post '/login', to: 'auth#create'
    end
  end

end
