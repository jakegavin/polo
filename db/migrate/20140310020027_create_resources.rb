class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.string :filename
      t.boolean :active
      t.timestamps
    end
  end
end
