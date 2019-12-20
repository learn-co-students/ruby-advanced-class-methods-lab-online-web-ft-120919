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
  
    self.new.tap {|song| song.new }
  end 
  def self.new_by_name(name)
    self.new.tap {|song| song.name = name}
  end
  def self.create_by_name(name)
    self.new_by_name(name).tap{ |song| song.save}
  end 
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def.self_or_find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
   end 
   
   def self.alphabetical
     self.all.sort_by {|song| song.name}
   end 
end
