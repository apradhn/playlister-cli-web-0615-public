class Genre
  attr_accessor :name, :songs, :artists
  @@genres = []

  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def self.reset_all
    @@genres = []
  end

  def self.count
    @@genres.size
  end

  def self.all
    @@genres
  end

  def self.find_by_name(name)
    @@genres.find{|genre| genre.name == name}
  end

  def self.create_by_name(name)
    Genre.new.tap{|genre| genre.name = name}
  end
end