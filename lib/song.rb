class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    # @@all.each do |song|
    #   if song == self.find_by_name(name)
    #   else
    #   self.create_by_name(name)
    #   end
    # end

    self.find_by_name(name) || self.create_by_name(name)
    #find by name, otherwise do this

  end

  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    filename_array = filename.split("-")
    filename_array[1] = filename_array[1].chomp(".mp3")
    song = self.new
    song.name = filename_array[1].strip
    song.artist_name = filename_array[0].strip
    song
  end

  def self.create_from_filename(filename)
    filename_array = filename.split("-")
    filename_array[1] = filename_array[1].chomp(".mp3")
    song = self.new.save
    song.name = filename_array[1].strip
    song.artist_name = filename_array[0].strip
    song
  end

  def self.destroy_all
    @@all.clear
  end



end
