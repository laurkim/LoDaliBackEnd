Rails.application.routes.draw do
  resources :top_tracks
  resources :logins
  resources :songs
  resources :artists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
