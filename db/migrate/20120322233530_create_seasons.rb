class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.references :player
      t.integer :year
      t.integer :tm_g
      t.integer :age
      t.boolean :was_c, default: false
      t.boolean :was_rp, default: false
      t.decimal :war_pos
      t.decimal :war_p
      t.decimal :war_tot
      t.decimal :war_162
      t.decimal :wae
      t.decimal :wam
      t.integer :b_g
      t.integer :b_pa
      t.integer :b_ab
      t.integer :b_r
      t.integer :b_h
      t.integer :b_2b
      t.integer :b_3b
      t.integer :b_hr
      t.integer :b_rbi
      t.integer :b_bb
      t.integer :b_ibb
      t.integer :b_so
      t.integer :b_hbp
      t.integer :b_sh
      t.integer :b_sf
      t.integer :b_gdp
      t.integer :b_sb
      t.integer :b_cs
      t.decimal :ba
      t.decimal :obp
      t.decimal :slg
      t.decimal :ops
      t.integer :pos
      t.integer :p_g
      t.integer :p_gs
      t.integer :p_cg
      t.integer :p_sho
      t.integer :p_gf
      t.integer :p_w
      t.integer :p_l
      t.decimal :p_wl
      t.integer :p_sv
      t.decimal :p_iptrue
      t.decimal :p_ip
      t.integer :p_h
      t.integer :p_r
      t.integer :p_er
      t.integer :p_bb
      t.integer :p_so
      t.decimal :era
      t.integer :eraplus
      t.integer :p_hr
      t.integer :p_bf
      t.decimal :r_pct

      t.timestamps
    end
    add_index :seasons, :player_id
  end
end
