class AddColumnFutureWwarToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :future_wwar, :boolean, :default => false

    execute %( UPDATE players SET future_wwar = true WHERE id IN (
                 SELECT id FROM players
                   WHERE hof_status IN ('active', 'ineligible')
                     AND wwar_status = false
                     AND wwar_norm >= 19.2
              )
             )
  end
end
