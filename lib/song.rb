class Song

  attr_accessor :name, :artist_name
  @@all = []

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

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.new_from_filename(file)
    formatted = file.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = formatted[0]
    song.name = formatted[1]
    song
  end

  def self.create_from_filename(file)
    formatted = file.chomp(".mp3").split(" - ")
    song = self.create
    song.artist_name = formatted[0]
    song.name = formatted[1]
    song
  end

end
