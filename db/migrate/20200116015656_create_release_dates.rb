class CreateReleaseDates < ActiveRecord::Migration[6.0]
  def change
    create_table :release_dates do |t|
      t.string :date
      t.integer :game_id

      t.timestamps
    end
  end
end
