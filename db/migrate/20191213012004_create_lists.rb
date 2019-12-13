class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :list_type
      t.string :visibility

      t.timestamps
    end
  end
end
