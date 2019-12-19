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
  
  def self.create
    new_song = self.new 
    new_song.tap{|song| song.save}
  end 
  
  def self.new_by_name(name)
    new_song = self.new 
    new_song.tap {|song| song.name = name}
  end 
  
  def self.create_by_name(name)
    new_song = self.create 
    new_song.tap {|song| song.name = name}
  end 
  
  def self.find_by_name(name)
    self.all.detect{|item| item.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    result ? result : self.create_by_name(name)
  end 
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    artist, name = filename.split("-").collect{|word| word.strip.delete_suffix(".mp3")}
    new_song = self.new_by_name(name)
    new_song.artist_name = artist 
    new_song
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
  def self.destroy_all
    self.all.clear
  end 
end
