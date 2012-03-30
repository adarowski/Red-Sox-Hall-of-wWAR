class UpdateNewStatuses < ActiveRecord::Migration
  def up
    "Curt Schilling, Marty Barrett, Joe Dobson, Dutch Leonard, Ellis Burks".split(', ').each do |name|
      Player.where(full_name: name).first.update_attributes!(hof_status: 'hof', induction_year: 2012)
    end

    "Curt Schilling, Ellis Burks, Jim Piersall, Wally Schang, Jesse Tannehill".split(', ').each do |name|
      Player.where(full_name: name).first.update_attributes!(wwar_status: true, future_wwar: false)
    end
  end

  def down
    raise "oh no"
  end
end
