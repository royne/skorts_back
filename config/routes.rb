Rails.application.routes.draw do
  default_url_options :host => "http://localhost:4000"

  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get 'users/current' => 'users#current'
      
      resources :users
      post 'create_escort', to: 'users#create_escort'
      
      resources :escort_profiles 
      get 'escorts_selected', to: 'escort_profiles#escorts_selected'
      get 'one_profile', to: 'escort_profiles#one_profile'
    end
  end
end
