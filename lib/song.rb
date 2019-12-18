require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    Song.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name=name
    return song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    Song.all << song
    return song
  end

  def self.find_by_name(name)
    song = nil
    Song.all.find do |song|
      if(song.name == name)
        return song
      end
    end
    return song
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)

    if (!song)
      song = Song.create_by_name(name)
    end
    return song
  end

  def self.alphabetical
    Song.all.sort_by { |song | song.name  }
  end

  def self.new_from_filename(fileName)
    artist_song = fileName.split("-")
    artist_name = artist_song[0].strip
    song_name = artist_song[1].sub!(".mp3","").strip
    song = self.new
    song.name=song_name
    song.artist_name =artist_name
    song
  end

  def self.create_from_filename(fileName)
    song = new_from_filename(fileName)
    Song.all << song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    Song.all << self
  end

end
