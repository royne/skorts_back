Rails.application.routes.draw do
  resources :escort_profiles
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get 'users/current' => 'users#current'
      
      resources :users
      post 'create_escort', to: 'users#create_escort'
    end
  end
end
