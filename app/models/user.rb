class User < ApplicationRecord
  has_many :top_tracks
  has_many :personality_insights
  has_many :track_features
  has_many :recommended_playlists

  def access_token_expired?
    (Time.now - self.updated_at) > ENV["TIME"].to_i
  end

end
