class CreateTopTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :top_tracks do |t|
      t.string :songs

      t.timestamps
    end
  end
end
