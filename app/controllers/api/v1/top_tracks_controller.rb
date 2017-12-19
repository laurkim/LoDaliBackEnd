class Api::V1::TopTracksController < ApplicationController
  def create
    decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
    header = {'Authorization': "Bearer " + decoded[0]["access_token"]}
    top_tracks_response = RestClient.get("https://api.spotify.com/v1/me/top/tracks", header)
    top_tracks_params = JSON.parse(top_tracks_response.body)
    render json: {top_tracks: top_tracks_params}
  end
end
