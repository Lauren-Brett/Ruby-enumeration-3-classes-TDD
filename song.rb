class Song

attr_reader :artist, :title, :time_of_song

  def initialize(artist, title, time_of_song)
  @artist = artist
  @title = title
  @time_of_song = time_of_song
end

def title_of_song(song)
  return song.title
end




end
