class Player < ActiveRecord::Base
  has_many :seasons

  def self.find_or_create_by(attributes_hash)
    Player.where(full_name: attributes_hash['full_name']).first ||
      Player.create(attributes_hash.slice(*Player.column_names))
  end

  def as_json(options = {})
    content = attributes.slice(*(Player.column_names - ['created_at', 'updated_at']))

    if options[:with_seasons]
      content.merge!(seasons: seasons.as_json)
    end

    content
  end
end
