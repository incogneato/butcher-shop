class CreateCuts < ActiveRecord::Migration
  def up
    create_table :cuts do |t|
      t.string :name
      t.references :primal_cut
      t.references :animal

      t.timestamps
    end
    add_index :cuts, :primal_cut_id
    add_index :cuts, :animal_id
  end

  def down
    drop_table :cuts

    remove_index :cuts, :primal_cut_id
    remove_index :cuts, :animal_id
  end
end
