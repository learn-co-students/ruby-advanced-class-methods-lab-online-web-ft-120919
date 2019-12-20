require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #########################################


  def self.create #constructor
    song = self.new #instantiates an instance, stores it to variable song
    song.save #saves the song
    song #returns the new song that was created

    #self.new.tap { |song| song.save }
  end

  def self.new_by_name(name) #takes in the string name of a song 
    # binding.pry
    #returns a song instance with that name set as its name property 
    #and the song being saved into the @@all class variable.
    new_song = self.new
    new_song.name = name
    new_song
    #self.new.tap { |song| song.new = name }
  end

  def self.find_by_name(song)
    self.all.detect { |artist| artist.name == song}
    # result = nil
    # @@all.each_with_index do |artist|
    #   binding.pry
    #   result = artist if artist.name == name 
    # end
    # result
  end

  def self.create_by_name(song)
    #self.new_by_name(name).tap {|song| song.save}
    songs_name = self.create
    songs_name.name = song
    songs_name
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name} #ascending order
    # self.all.sort {|a, b| b.name <=> a.name} #descending order
  end

  def self.new_from_filename(filename)
    # binding.pry
    #initializes a song and artist_name based on the filename format
    artist_name, song_name = filename.split(" - ")
    song = self.new_by_name(song_name.chomp(".mp3"))
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap {|song| song.save}
  end

  def self.destroy_all #reset method
    # @@all.clear
    self.all.clear
  end

end
