# Rails.application.routes.draw do
#   resources :top_tracks
#   resources :logins
#   resources :songs
#   resources :artists
#   resources :users
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'login', to: 'logins#create'
      post 'home', to: 'users#create'
      get 'current_user', to: 'logins#show'

      get 'songs', to: 'songs#create'
      get 'artists', to: 'artists#create'
      # get 'related_artists', to: 'related_artists#create'
      get 'top_tracks', to: 'top_tracks#create'
    end
  end
end
