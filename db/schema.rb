# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120324171439) do

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "pos"
    t.decimal  "war_pos"
    t.decimal  "war_p"
    t.decimal  "war_tot"
    t.decimal  "war_162"
    t.decimal  "wae"
    t.decimal  "wam"
    t.decimal  "wwpa"
    t.decimal  "wwar"
    t.decimal  "c_pct"
    t.decimal  "rp_pct"
    t.decimal  "wwar_norm"
    t.boolean  "is_pitcher",     :default => false
    t.boolean  "is_hitter",      :default => false
    t.integer  "b_pa"
    t.integer  "b_ab"
    t.integer  "b_h"
    t.integer  "b_2b"
    t.integer  "b_3b"
    t.integer  "b_hr"
    t.integer  "b_bb"
    t.integer  "b_hbp"
    t.integer  "b_sf"
    t.decimal  "ba"
    t.decimal  "obp"
    t.decimal  "slg"
    t.integer  "ops_plus"
    t.integer  "p_w"
    t.integer  "p_l"
    t.integer  "p_sv"
    t.decimal  "p_ip"
    t.integer  "p_h"
    t.integer  "p_er"
    t.integer  "p_bb"
    t.integer  "p_so"
    t.integer  "p_hr"
    t.decimal  "era"
    t.integer  "era_plus"
    t.string   "hof_status"
    t.integer  "induction_year"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "wwar_status",    :default => false
    t.boolean  "future_wwar",    :default => false
  end

  add_index "players", ["full_name"], :name => "index_players_on_full_name", :unique => true

  create_table "seasons", :force => true do |t|
    t.integer  "player_id"
    t.integer  "year"
    t.integer  "tm_g"
    t.integer  "age"
    t.boolean  "was_c",      :default => false
    t.boolean  "was_rp",     :default => false
    t.decimal  "war_pos"
    t.decimal  "war_p"
    t.decimal  "war_tot"
    t.decimal  "war_162"
    t.decimal  "wae"
    t.decimal  "wam"
    t.integer  "b_g"
    t.integer  "b_pa"
    t.integer  "b_ab"
    t.integer  "b_r"
    t.integer  "b_h"
    t.integer  "b_2b"
    t.integer  "b_3b"
    t.integer  "b_hr"
    t.integer  "b_rbi"
    t.integer  "b_bb"
    t.integer  "b_ibb"
    t.integer  "b_so"
    t.integer  "b_hbp"
    t.integer  "b_sh"
    t.integer  "b_sf"
    t.integer  "b_gdp"
    t.integer  "b_sb"
    t.integer  "b_cs"
    t.decimal  "ba"
    t.decimal  "obp"
    t.decimal  "slg"
    t.decimal  "ops"
    t.string   "pos"
    t.integer  "p_g"
    t.integer  "p_gs"
    t.integer  "p_cg"
    t.integer  "p_sho"
    t.integer  "p_gf"
    t.integer  "p_w"
    t.integer  "p_l"
    t.decimal  "p_wl"
    t.integer  "p_sv"
    t.decimal  "p_iptrue"
    t.decimal  "p_ip"
    t.integer  "p_h"
    t.integer  "p_r"
    t.integer  "p_er"
    t.integer  "p_bb"
    t.integer  "p_so"
    t.decimal  "era"
    t.integer  "eraplus"
    t.integer  "p_hr"
    t.integer  "p_bf"
    t.decimal  "r_pct"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "seasons", ["player_id"], :name => "index_seasons_on_player_id"

end
