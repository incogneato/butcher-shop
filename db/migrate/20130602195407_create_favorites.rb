class CreateFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.string :name
      t.string :meal
      t.references :cut
      t.references :user

      t.timestamps
    end
    add_index :favorites, :cut_id
    add_index :favorites, :user_id
  end

  def down
    drop_table :favorites

    remove_index :favorites, :cut_id
    remove_index :favorites, :user_id
  end
end
