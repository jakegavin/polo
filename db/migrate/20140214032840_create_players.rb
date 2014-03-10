class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :team
      t.integer :number
      t.string :position
      t.integer :grad_year
    end
  end
end
