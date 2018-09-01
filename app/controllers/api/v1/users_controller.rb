class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    auth_params = SpotifyAdapter.login(params[:code])
    user_data = SpotifyAdapter.getUserData(auth_params["access_token"])

    user = User.find_or_create_by(user_params(user_data))

    img_url = user_data["images"][0] ? user_data["images"][0]["url"] : nil

    encodedAccess = issue_token({token: auth_params["access_token"]})
    encodedRefresh = issue_token({token: auth_params["refresh_token"]})

    user.update(profile_img_url: img_url, access_token: encodedAccess, refresh_token: encodedRefresh)

    render json: user_with_token(user)
  end

  def show
    encrypted_user_id = params["jwt"]
    user_id = JWT.decode(encrypted_user_id, ENV["MY_SECRET"], ENV["EGGS"])
    @user = User.find_by(id: user_id[0]["user_id"])

    jwt_payload = {:user_id => @user.id}
    jwt = JWT.encode(jwt_payload, ENV["MY_SECRET"], ENV["EGGS"])
    serialized_user = UserSerializer.new(@user).attributes
    render json: {currentUser: serialized_user, code: jwt}
  end

  private

  def user_with_token(user)
    payload = {user_id: user.id}
    jwt = issue_token(payload)
    serialized_user = UserSerializer.new(user).attributes
    {currentUser: serialized_user, code: jwt}
  end

  def user_params(user_data)
    params = {
      username: user_data["id"],
      display_name: user_data["display_name"],
      spotify_url: user_data["external_urls"]["spotify"],
      href: user_data["href"],
      uri: user_data["uri"]
    }
  end
end
