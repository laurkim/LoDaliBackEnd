class PersonalityInsightSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :username, :password
end
