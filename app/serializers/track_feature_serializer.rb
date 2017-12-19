class TrackFeatureSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :audio_features
end
