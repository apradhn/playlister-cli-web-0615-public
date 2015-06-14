class LibraryParser

  def files
    # This method should return all the filenames within the target directory.
    Dir.entries("db/data").delete_if{|entry| entry == "." || entry == ".."}
  end

  def parse_filename(file)
    file.split(/ - | \[|\]\.mp3/)
  end

  def build_song(artist_name, song_name, genre_name)
    Song.new.tap do |song|
      song.name = song_name
      song.artist = Artist.new.tap{|artist| artist.name = artist_name}
      song.genre = Genre.new.tap{|genre| genre.name = genre_name}
    end
  end

  def call
    files.each do |file|
      elements = parse_filename(file)
      build_song(elements[0], elements[1], elements[2])
    end
  end
end