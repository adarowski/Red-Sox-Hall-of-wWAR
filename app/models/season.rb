class Season < ActiveRecord::Base
  belongs_to :player

  def as_json(options={})
    attributes.slice(*(Season.column_names - ['created_at', 'updated_at']))
  end
end
