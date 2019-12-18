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
    # self.new.tap{ |inst| inst.save }
    inst = self.new
    inst.save
    inst
  end

  def self.new_by_name(name)
    inst = self.new
    inst.name = name
    inst
  end

  def self.create_by_name(name)
    inst = self.new
    inst.name = name
    inst.save
    inst
  end

  def self.find_by_name(name)
    self.all.each do |music|
      return music if music.name == name
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(file_name)
    inst = self.new
    song_array = file_name.chomp(".mp3").split(" - ")
    inst.artist_name = song_array[0]
    inst.name = song_array[1]
    inst
  end

  def self.create_from_filename(file_name)
    inst = self.new_from_filename(file_name)
    inst.save
    inst
  end

  def self.destroy_all
    @@all.clear
  end
end
