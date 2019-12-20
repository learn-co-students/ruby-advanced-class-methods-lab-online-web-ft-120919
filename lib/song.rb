class Song
  attr_accessor :name, :artist_name
  @@all = []

 def initialize
 end 


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end 
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
 def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name 
    song 
  end


 def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    if song == nil
      song = self.create_by_name(title)
    end
    song
  end
  
   def self.alphabetical
   self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
  
end

