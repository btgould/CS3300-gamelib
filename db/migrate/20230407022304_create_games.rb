class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.float :price
      t.integer :interest
      t.text :description

      t.timestamps
    end
  end
end
