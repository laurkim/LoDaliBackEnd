class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :access_token, :refresh_token, :spotify_url, :profile_img_url, :href, :uri, :full_library, :last_library_update
end
