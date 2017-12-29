class Api::V1::RecommendedPlaylistsController < ApplicationController
  def create
    body = {track_ids: params[:q].chomp('"').reverse.chomp('"').reverse}
    decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
    header = {'Authorization': "Bearer " + decoded[0]["access_token"]}
    recommended_playlist_response = RestClient.get("https://api.spotify.com/v1/recommendations?seed_tracks=#{body[:track_ids]}", header)
    recommended_playlist_params = JSON.parse(recommended_playlist_response.body)
    new_playlist = RestClient.post("https://api.spotify.com/v1/users/{user_id}/playlists")
    render json: {playlist: recommended_playlist_params}
  end
end
