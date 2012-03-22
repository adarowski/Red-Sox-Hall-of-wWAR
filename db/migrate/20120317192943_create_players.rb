class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name

      t.timestamps
    end
    add_index :players, :full_name, unique: true
  end
end
