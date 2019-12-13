class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.integer :game_id
      t.integer :list_id

      t.timestamps
    end
  end
end
