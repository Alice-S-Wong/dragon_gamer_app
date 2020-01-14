class AddApiIdToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :api_id, :integer
  end
end
