class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :team1_name
      t.string :team2_name
      t.integer :team1_score
      t.integer :team2_score
      t.string :winner
      t.string :tournament_name
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :raid_time

      t.timestamps
    end
  end
end
