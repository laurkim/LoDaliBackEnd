class Api::V1::TrackFeaturesController < ApplicationController
  def create
    # debugger
    # content = params[:q]
    # username = ENV[USERNAME]
    # password = ENV["PASSWORD"]
    #
    # response = Excon.post("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13"
    #   body: content,
    #   headers: { "Content-Type": "text/plain" },
    #   user: username,
    #   password: password,
    #   query: {
    #      "raw_scores": true,
    #      "consumption_preferences": true,
    #      "version": "2017-10-13"
    #   }
    # )
    #
    # insights = JSON.parse(response.body)
    # new_insight = PersonalityInsight.create(insight: insights, user_id: my_user.id)
    # my_user.personality_insights << new_insight
    #
    # render json: { personality_insights: insights }
  end
end
