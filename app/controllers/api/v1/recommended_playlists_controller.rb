class Api::V1::RecommendedPlaylistsController < ApplicationController
  def createTracks
    # creates tracks for new playlist based on user's listening habits
    body = {track_ids: params[:q].chomp('"').reverse.chomp('"').reverse}
    decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
    header = {'Authorization': "Bearer " + decoded[0]["token"]}
    recommended_playlist_response = RestClient.get("https://api.spotify.com/v1/recommendations?seed_tracks=#{body[:track_ids]}", header)
    recommended_playlist_params = JSON.parse(recommended_playlist_response.body)
    render json: {playlist: recommended_playlist_params}
  end

  def createPlaylist
    # creates new empty playlist on user's Spotify account
    decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
    header = {
      'Authorization': "Bearer " + decoded[0]["token"],
      'Content-Type': 'application/json',
    }
    body = {
      "name": "Sonder App Playlist",
      "public": true
    }
    new_playlist_response = RestClient.post("https://api.spotify.com/v1/users/#{my_user.username}/playlists", body.to_json, header)
    new_playlist = JSON.parse(new_playlist_response.body)
    @new_playlist = RecommendedPlaylist.find_or_create_by(
      user_id: my_user.id,
      playlist_id: new_playlist["id"]
    )
    render json: {new_playlist: new_playlist}
  end

  def addTracksToPlaylist
  # add tracks from create action to playlist from createPlaylist action
  body = {"uris": params[:q].split(",")}
  decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
  header = {
    'Authorization': "Bearer " + decoded[0]["token"],
    'Content-Type': 'application/json',
  }
  @playlist = RecommendedPlaylist.find_by(user_id: my_user.id)
  add_tracks_response = RestClient.post("https://api.spotify.com/v1/users/#{my_user.username}/playlists/#{@playlist.playlist_id}/tracks", body.to_json, header)
  render json: {playlist: @playlist}
  end
end
