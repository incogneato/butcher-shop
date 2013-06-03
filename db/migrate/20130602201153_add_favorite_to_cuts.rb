class AddFavoriteToCuts < ActiveRecord::Migration
  def up
    add_column :cuts, :favorite_id, :integer
    add_index  :cuts, :favorite_id
  end

  def down
    remove_column :cuts, :favorite_id
    remove_index  :cuts, :favorite_id
  end
end
