module PlayersHelper
  PLAYER_TOTAL_STAT_ATTRIBUTES = [
    # everyone
    "war_pos", "war_p", "war_tot", "war_162", "wae", "wam", "wwpa",
    "wwar", "wwar_norm",
    # pitchers
    "era", "era_plus", "p_w", "p_l", "p_sv",
    # batters
    "ba", "obp", "ops_plus", "slg",
  ]

  PLAYER_SEASON_STAT_ATTRIBUTES = [
    "year", "age", "war_pos", "war_p", "war_tot",
    "war_162", "wae", "wam",
    "b_g", "b_pa", "b_ab", "b_r", "b_h", "b_2b", "b_3b", "b_hr", "b_rbi",
    "b_bb", "b_so", "b_hbp", "b_sh", "b_sf", "b_gdp", "b_sb", "b_cs",
    "ba", "obp", "slg", "ops",
    "p_g", "p_gs", "p_cg", "p_sho", "p_gf", "p_w", "p_l", "p_sv", "p_ip",
    "p_h", "p_r", "p_er", "p_bb", "p_so", "era", "eraplus", "p_hr", "p_bf"
  ]

  def wwar_hall_count
    @players.select(&:wwar_status).size
  end

  def whos_next_count
    @players.select(&:future_wwar).size
  end

  def whos_in_count
    @players.select{|p| p.wwar_status && p.hof_status != 'hof'}.size
  end

  def whos_out_count
    @players.select{|p| !p.wwar_status && p.hof_status == 'hof'}.size
  end

  def player_class player
    [
      "pos-#{player.pos}",
      player.hof_status || 'no_hof',
      (player.wwar_status ? 'wwar' : ''),
      (player.future_wwar ? 'future' : '')
    ].join(' ').squish
  end

  def player_image player
    "/images/#{player.first_name.gsub(/ /, '')}_#{player.last_name}.jpg".downcase
  end

  def human_column(column)
    column.sub(/^[pb]_/, '').humanize.upcase.sub(/WWAR /, 'WWAR/')
  end

  def player_total_stats player
    columns = []
    values = []

    player.attributes.slice(*PLAYER_TOTAL_STAT_ATTRIBUTES).each do |column, value|
      unless value.blank?
        columns << [human_column(column), t(column)]
        values << value
      end
    end

    [columns, values]
  end

  def player_season_stats player
    columns = ActiveSupport::OrderedHash.new

    player.seasons.order("year ASC").each do |season|
      PLAYER_SEASON_STAT_ATTRIBUTES.each do |column|
        columns[column] ||= []
        columns[column] << season.attributes[column]
      end
    end

    columns.reject! do |col, values|
      values.all?(&:blank?)
    end

    [
      columns.keys.map{|c| [human_column(c), t(c)]},
      columns.values.transpose
    ]
  end
end
