Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get 'users/current' => 'users#current'
      
      resources :users
      post 'create_escort', to: 'users#create_escort'
      
      resources :escort_profiles
      get 'escorts_selected', to: 'escort_profiles#escorts_selected'
    end
  end
end
