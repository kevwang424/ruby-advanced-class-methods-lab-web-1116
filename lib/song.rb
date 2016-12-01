class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    # debugger
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.class.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song.class.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.each { |instance| return instance if instance.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.all.each do |instance|
        return instance if instance.name == song_name
    end
    create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|instance| instance.name }
  end

  def self.new_from_filename(file)
    artist_song = file.gsub(".mp3","").split(" - ")
    new_song = Song.new
    new_song.name = artist_song[1]
    new_song.artist_name = artist_song[0]
    new_song
  end

  def self.create_from_filename(file)
    artist_song = file.gsub(".mp3","").split(" - ")
    new_song = Song.new
    new_song.name = artist_song[1]
    new_song.artist_name = artist_song[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
