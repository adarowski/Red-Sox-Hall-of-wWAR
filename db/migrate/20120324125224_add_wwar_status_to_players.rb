class AddWwarStatusToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :wwar_status, :boolean, default: false

    execute %( UPDATE players SET wwar_status = true WHERE id IN (
                 SELECT id FROM players
                   WHERE hof_status NOT IN ('active', 'ineligible') OR hof_status IS NULL
                   ORDER BY wwar_norm desc NULLS LAST limit 56
              )
             )
  end
end
