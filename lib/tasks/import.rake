def cast_row(h)
  ['was_rp', 'was_c', 'is_pitcher', 'is_hitter'].each do |key|
    h[key] = h[key] == "yes" if h.key?(key)
  end

  h
end

task :import => :environment do
  require 'csv'

  Player.delete_all
  Season.delete_all

  player_seasons = CSV.parse(File.open("#{Rails.root}/lib/assets/bos-seasons.csv"))

  headers = player_seasons.shift

  player_seasons.map{|row| Hash[headers.zip(row)] }.each do |player_season|
    player_season = cast_row(player_season)

    player = Player.find_or_create_by(player_season)
    Season.create(player_season.slice(*Season.column_names).merge(:player_id => player.id))
  end


  player_totals = CSV.parse(File.open("#{Rails.root}/lib/assets/bos-totals.csv"))

  headers = player_totals.shift

  player_totals.map{|row| Hash[headers.zip(row)] }.each do |player_total|
    player_total = cast_row(player_total)

    player = Player.find_or_create_by(player_total)
    player.update_attributes(player_total)
  end
end
