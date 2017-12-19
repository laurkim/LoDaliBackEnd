class CreateTrackFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :track_features do |t|
      t.integer :user_id
      t.json :audio_features

      t.timestamps
    end
  end
end
