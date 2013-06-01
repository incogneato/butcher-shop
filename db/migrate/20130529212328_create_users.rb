class CreateUsers < ActiveRecord::Migration
  def change
    # can_has_table :users do |t| ---> nicely done.
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
