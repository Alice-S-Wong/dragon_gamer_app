class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.decimal :cumulative_rating, precision: 3, scale: 1
      t.integer :release_year

      t.timestamps
    end
  end
end
