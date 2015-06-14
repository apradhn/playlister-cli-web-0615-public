require "pry"

class Artist
  attr_accessor :name, :songs, :genres
  @@artists = []

  def initialize
    @@artists << self
    @songs = []
    @genres = []
  end

  def self.reset_all
    @@artists = []
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.size
  end

  def self.find_by_name(name)
    @@artists.find{|artist| artist.name == name}
  end

  def self.create_by_name(name)
    Artist.new.tap{|artist| artist.name = name}
  end

  def add_song(song)
    @songs << song
    @genres << song.genre
    song.genre.artists << self if song.genre && !(song.genre.artists.include?(self))
  end

  def add_songs(songs)
    songs.each {|song| @songs << song}
  end
end