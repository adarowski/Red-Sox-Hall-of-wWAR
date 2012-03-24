class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name

      t.string  :pos
      t.decimal :war_pos
      t.decimal :war_p
      t.decimal :war_tot
      t.decimal :war_162
      t.decimal :wae
      t.decimal :wam
      t.decimal :wwpa
      t.decimal :wwar
      t.decimal :c_pct
      t.decimal :rp_pct
      t.decimal :wwar_norm
      t.boolean :is_pitcher, :default => false
      t.boolean :is_hitter, :default => false
      t.integer :b_pa
      t.integer :b_ab
      t.integer :b_h
      t.integer :b_2b
      t.integer :b_3b
      t.integer :b_hr
      t.integer :b_bb
      t.integer :b_hbp
      t.integer :b_sf
      t.decimal :ba
      t.decimal :obp
      t.decimal :slg
      t.integer :ops_plus
      t.integer :p_w
      t.integer :p_l
      t.integer :p_sv
      t.decimal :p_ip
      t.integer :p_h
      t.integer :p_er
      t.integer :p_bb
      t.integer :p_so
      t.integer :p_hr
      t.decimal :era
      t.integer :era_plus
      t.string :hof_status
      t.integer :induction_year

      t.timestamps
    end
    add_index :players, :full_name, :unique => true
  end
end
