
class Song
    attr_accessor :artist_name, :name
      @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  
  end
  
  def self.new_by_name(name)
    self.new.tap {|song| song.name = name}
  end
  def self.create_by_name(name)
    self.new_by_name(name).tap {|song| song.save}
  end
  def save
    self.class.all << self
  end
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end  
  def self.create
    song = self.new
    song.save
    return song
  end
  
  def self.find_or_create_by_name(name)
    if 
      song = find_by_name(name)
      song
    else
      create_by_name(name)
    end
  end 
  def self.alphabetical
  self.all.sort_by {|song| song.name}
  end
  def self.new_from_filename(filename)
    artist_name, song_name = filename.split (" - ")
    song = self.new_by_name(song_name.chomp (".mp3"))
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(filename)
    self.new_from_filename.tap {|song| song.save}
  end
end