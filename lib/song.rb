class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song 
  end

  def self.new_by_name(a_name)
    song = Song.new 
    song.name = a_name 
    song 
  end #new_by_name

  def self.create_by_name(a_name)
    song = Song.new 
    song.name = a_name
    self.all << song 
    song 
  end #create_by_name

  def self.find_by_name(a_name)
    self.all.find{|song| song.name == a_name}
  end #find_by_name

  def self.find_or_create_by_name(a_name)
    matching_song = self.find_by_name(a_name)
    if !matching_song
      song = self.create_by_name(a_name)
      song
    else
      matching_song
    end #if 
  end #find_or_create

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end #self.alphabetical

  def self.new_from_filename(filename)
    song = Song.new
    song_info = filename.split("-")
    clean_song_info = song_info.collect do |info|
      info.strip
    end #each
    song_artist = clean_song_info[0]
    song_name = clean_song_info[1].slice(0,clean_song_info[1].length - 4)

    song.name = song_name 
    song.artist_name = song_artist 
    song 
  end #new_from_filename

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song 
  end #self.create_from_filename

  def self.destroy_all
    @@all.clear 
  end 

  def self.all
    @@all
  end

  def save
    #This is accessing the Song.all class method
    self.class.all << self
  end

end
