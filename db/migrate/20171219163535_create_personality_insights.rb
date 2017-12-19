class CreatePersonalityInsights < ActiveRecord::Migration[5.1]
  def change
    create_table :personality_insights do |t|
      t.integer :user_id
      t.json :insight

      t.timestamps
    end
  end
end
