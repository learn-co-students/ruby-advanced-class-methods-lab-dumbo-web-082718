require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize (name=nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all.push(new_song)
    new_song
  end

  def self.new_by_name(song_name)
    Song.new(song_name)
  end

  def self.create_by_name(song_name)
    new_instance = Song.new(song_name)
    @@all.push(new_instance)
    new_instance
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort do |a,b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    artist_name = filename.split("-")[0].strip
    song_name = filename.split("-")[1].split(".")[0].strip
    filetype = ".#{filename.split("-")[1].split(".")[1]}"
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_name = filename.split("-")[0].strip
    song_name = filename.split("-")[1].split(".")[0].strip
    filetype = ".#{filename.split("-")[1].split(".")[1]}"
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
  end

  def self.destroy_all
    @@all.clear
  end
























end
