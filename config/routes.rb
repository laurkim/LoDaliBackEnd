Rails.application.routes.draw do
  resources :track_features
  resources :personality_insights
  namespace :api do
    namespace :v1 do
      get 'login', to: 'logins#create'
      post 'home', to: 'users#create'
      get 'current_user', to: 'logins#show'
      post 'fetch_user', to: 'users#show'
      get 'top_tracks', to: 'top_tracks#create'
      get 'artists', to: 'artists#create'
      get 'personality_insights', to: 'personality_insights#create'
      get 'track_features', to: 'track_features#create'
    end
  end
end
