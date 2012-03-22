task :import => :environment do
  require 'csv'

  Player.delete_all
  Season.delete_all

  player_seasons = CSV.parse(File.open("#{Rails.root}/lib/assets/bos.csv"))

  headers = player_seasons.shift

  player_seasons.map{|row| Hash[headers.zip(row)] }.each do |player_season|
    player = Player.find_or_create_by(player_season)
    Season.create(player_season.slice(*Season.column_names).merge(:player_id => player.id))
  end
end
