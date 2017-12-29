class CreateRecommendedPlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :recommended_playlists do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
