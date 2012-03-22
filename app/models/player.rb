class Player < ActiveRecord::Base
  has_many :seasons

  def self.find_or_create_by(attributes_hash)
    Player.where(full_name: attributes_hash['full_name']).first ||
      Player.create(attributes_hash.slice(*Player.column_names))
  end

  def as_json(options = {})
    attributes.slice(*(Player.column_names - ['created_at', 'updated_at']))
  end
end
