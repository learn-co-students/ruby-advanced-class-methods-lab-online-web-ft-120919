class Song

  # class var array @@all
  @@all = []

  # Creates getters and setters for song name and artist name
  attr_accessor :name, :artist_name

  # Returns class array @@all
  def self.all
    @@all
  end

  # Pushes obj self to @@all
  def save
    self.class.all << self
  end

  # Creates new obj; Pushes obj to @@all; Returns new obj
  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  # Creates new obj; Sets obj name; Returns new obj
  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  # Creates new obj; Sets obj name; Pushes obj to @@all; Returns new obj
  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  # Searches for song obj by checking for song name
  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name}
  end

  # If song exists, then return obj w/ that song name, else create new obj w/ that song name
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  # Sorts all objs in @@ by alphabetical order
  def self.alphabetical
    @@all.sort_by! { |song| song.name }
  end

  # Creates new song; Sets song name / artist name from file format; Returns new obj
  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end

  # Creates new song; Sets song name / artist name from file format; Pushes obj to @@all
  def self.create_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    @@all << new_song
  end

  # Sets all to empty array
  def self.destroy_all
    @@all = []
  end
end
