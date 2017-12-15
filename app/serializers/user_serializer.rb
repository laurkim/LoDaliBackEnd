class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :spotify_url, :profile_img_url, :full_library
end
