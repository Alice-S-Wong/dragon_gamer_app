class AddApiIdToPlatforms < ActiveRecord::Migration[6.0]
  def change
    add_column :platforms, :api_id, :integer
  end
end
