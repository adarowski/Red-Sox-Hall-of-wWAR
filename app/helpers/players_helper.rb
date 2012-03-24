module PlayersHelper
  PLAYER_TOTAL_STAT_ATTRIBUTES = [
    # everyone
    "wwar_norm", "war_pos", "war_p", "war_tot", "war_162", "wae", "wam", "wwpa",
    # pitchers
    "era", "era_plus", "p_w", "p_l", "p_sv",
    # batters
    "ba", "obp", "slg", "ops_plus"
  ]

  PLAYER_SEASON_STAT_ATTRIBUTES = [
    "year", "age", "war_pos", "war_p", "war_tot",
    "wae", "wam",
    "b_g", "b_pa", "b_ab", "b_r", "b_h", "b_2b", "b_3b", "b_hr", "b_rbi",
    "b_bb", "b_so", "b_sb", "b_cs",
    "ba", "obp", "slg", "ops",
    "p_w", "p_l", "p_sv", "p_g", "p_gs", "p_cg", "p_sho", "p_ip",
    "p_h", "p_r", "p_er", "p_hr", "p_bb", "p_so", "era"
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
    column.sub(/^[pb]_/, '').humanize.upcase.sub(/ NORM/, '').sub(/WAR /, 'WAR/').sub('PLUS', '+')
  end

  def player_total_stats player
    columns = []
    values = []

    PLAYER_TOTAL_STAT_ATTRIBUTES.each do |column|
      unless player.attributes[column].blank?
        columns << [human_column(column), translation_or_default(column)]
        values << format_attribute(player, column)
      end
    end

    [columns, values]
  end

  def format_attribute(obj, column)
    value = obj.attributes[column]

    case column
    when 'era'
      sprintf("%.2f", value) if value.present?
    when "ba", "obp", "ops", "slg"
      sprintf("%.3f", value).sub(/^0/, '') if value.present?
    else
      value
    end
  end

  def player_season_stats player
    columns = ActiveSupport::OrderedHash.new

    player.seasons.order("year ASC").each do |season|
      PLAYER_SEASON_STAT_ATTRIBUTES.each do |column|
        columns[column] ||= []
        columns[column] << format_attribute(season, column)
      end
    end

    columns.reject! do |col, values|
      values.all?(&:blank?)
    end

    [
      columns.keys.map{|c| [human_column(c), translation_or_default(c)]},
      columns.values.transpose
    ]
  end

  def has_honors?
    @player.hof_status == 'hof' || @player.wwar_status || @player.future_wwar
  end

  def translation_or_default(key)
    if I18n.backend.send(:lookup, :en, key).present?
      t(key)
    else
      key.capitalize
    end
  end
end
