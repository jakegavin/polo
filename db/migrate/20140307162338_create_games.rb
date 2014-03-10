class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :tournament_id
      t.string :pool
      t.integer :team_id
      t.string :opponent
      t.date :date
      t.time :time
      t.boolean :home
    end
  end
end
