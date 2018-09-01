Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'login', to: 'logins#create'
      post 'home', to: 'users#create'
      get 'current_user', to: 'logins#show'
      post 'fetch_user', to: 'users#show'
      get 'users', to: "users#index"
      get 'top_tracks', to: 'top_tracks#create'
      get 'artists', to: 'artists#create'
      get 'personality_insights', to: 'personality_insights#create'
      get 'track_features', to: 'track_features#create'
      get 'top_artists', to: 'top_artists#create'
      get 'recommended_playlists', to: 'recommended_playlists#createTracks'
      post 'create_playlist', to: 'recommended_playlists#createPlaylist'
      post 'add_tracks_to_playlist', to: 'recommended_playlists#addTracksToPlaylist'
    end
  end
end
