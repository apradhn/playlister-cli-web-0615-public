class Song
  attr_accessor :name, :genre, :artist
  @@songs = []

  def initialize
    @@songs << self
  end

  def self.reset_all
    @@songs = []
  end

  def self.count
    @@songs.size
  end

  def self.all
    @@songs
  end

  def self.find_by_name(name)
    @@songs.find{|song| song.name == name}
  end

  def self.create_by_name(name)
    Song.new.tap{|song| song.name = name}
  end

  def to_s
    "#{@artist.name} - #{@name} [#{@genre.name}]"
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end
end