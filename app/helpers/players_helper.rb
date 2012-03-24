module PlayersHelper

  def player_class player
    [player.pos, player.hof_status || 'no_hof'].join(' ')
  end

end
