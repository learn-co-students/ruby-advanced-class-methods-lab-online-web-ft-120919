class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create 
    self.new.tap {|song| song.save}
  end 

def self.new_by_name(name)
  self.new.tap { |song| song.name = name }
end 

def self.create_by_name(name)
  self.new_by_name(name).tap {|song| song.save}
end 

def self.find_by_name(name)
  # self.create_by_name(name).tap {|song| song.name == name }
  self.all.find {|song| song.name == name }
end 

def self.find_or_create_by_name(name)
  if self.find_by_name(name) 
    return self.find_by_name(name)
  else 
    self.create_by_name(name)
end 
end 

def self.alphabetical
  self.all.sort_by {|song| song.name }
end 

def self.new_from_filename(filename)
  artist_name, song_name = filename.split(" - ")
  song = self.new_by_name(song_name.chomp(".mp3"))
  song.artist_name = artist_name 
  song
end 

def self.create_from_filename(filename)
  self.new_from_filename(filename).tap { |song| song.save }
end 

def self.destroy_all
  self.all.clear
end 

end
