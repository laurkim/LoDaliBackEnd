class Api::V1::TrackFeaturesController < ApplicationController
  def create
    body = {track_ids: params[:q].chomp('"').reverse.chomp('"').reverse}
    decoded = JWT.decode(my_user.access_token, ENV["MY_SECRET"], ENV["EGGS"])
    header = {'Authorization': "Bearer " + decoded[0]["token"]}
    track_features_response = RestClient.get("https://api.spotify.com/v1/audio-features/?ids=#{body[:track_ids]}", header)
    track_features_params = JSON.parse(track_features_response.body)
    render json: {track_features: track_features_params}
  end
end
