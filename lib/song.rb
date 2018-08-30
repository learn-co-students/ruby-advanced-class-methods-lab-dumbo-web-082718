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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
    # @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = Song.new
    artist_song_split = file_name.split(" - ")
    artist = artist_song_split[0]
    song_with_extension = artist_song_split[1]
    song_extension_split = song_with_extension.split(".")
    name = song_extension_split[0]
    song.artist_name = artist
    song.name = name
    song
  end

  def self.create_from_filename(file_name)
    song = Song.new
    artist_song_split = file_name.split(" - ")
    artist = artist_song_split[0]
    song_with_extension = artist_song_split[1]
    song_extension_split = song_with_extension.split(".")
    name = song_extension_split[0]
    song.artist_name = artist
    song.name = name
    @@all << song
  end


  def self.destroy_all
    @@all.clear
  end

end
