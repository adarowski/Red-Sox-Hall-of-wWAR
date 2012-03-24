class Player < ActiveRecord::Base
  has_many :seasons

  JSON_ATTRIBUTES = {
    :show  => (Player.column_names - ['created_at', 'updated_at']),
    :index => ['id', 'first_name', 'last_name', 'full_name', 'wwar_norm', 'hof_status', 'wwar_status']
  }

  def self.find_or_create_by(attributes_hash)
    Player.where(:full_name => attributes_hash['full_name']).first ||
      Player.create(attributes_hash.slice(*Player.column_names))
  end

  def as_json(options = {})
    options.reverse_merge!(:view => :show, :with_seasons => false)

    content = attributes.slice(*JSON_ATTRIBUTES[options[:view]])

    if options[:with_seasons]
      content.merge!(:seasons => seasons.as_json)
    end

    content
  end

  def to_param
    full_name.gsub(/ /, '-')
  end
end
