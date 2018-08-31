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
    song = self.new
    song.save
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

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort do |a,b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(file_name)
    split_song = file_name.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = split_song[0]
    song.name = split_song[1]
    song
  end

  def self.create_from_filename(file_name)
    split_song = file_name.chomp(".mp3").split(" - ")
    song = self.create
    song.artist_name = split_song[0]
    song.name = split_song[1]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
