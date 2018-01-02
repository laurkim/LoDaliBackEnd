class Api::V1::TopArtistsController < ApplicationController
  def create
    decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
    header = {'Authorization': "Bearer " + decoded[0]["token"]}
    top_artists_response = RestClient.get("https://api.spotify.com/v1/me/top/artists", header)
    top_artists_params = JSON.parse(top_artists_response.body)
    render json: {top_artists: top_artists_params}
  end
end
