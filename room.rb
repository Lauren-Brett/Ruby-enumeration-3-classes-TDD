 class Room

attr_reader :name, :till, :time_limit, :capacity

  def initialize(name, till, time_limit, songs_array = [] )
     @name = name
     @till = till
     @time_limit = 60
     @guests_in_room = []
     @capacity = 4
     @songs = songs_array
     # @playlist = [@song1, @song2, @song3, @song4]
     # @playlist = playlist
  end

def guest_counter()
  return @guests_in_room.length
end

# def capacity
#   if @occupancy.length >= @capacity
#     return "Room Full"
#   end
# end

def increse_number_of_guests(new_guest)
  return @guests_in_room.push(new_guest)
end

def decrease_number_guests(guest_finished)
  return @guests_in_room.delete(guest_finished)
end

# def update_occupancy
#   return @occupancy += 1
# end
def capacity
   if @guests_in_room.length >= @capacity
    return true
   end
   return "Still Space!"
end


def get_song_list()
  # binding.pry
  return @songs.length
end

def song_by_artist(specific_song)
   @songs.find { |song| song.artist == specific_song}
end

def song_by_time_in_mins(song_time)
  @songs.find { |song| song.time_of_song == song_time}
end



end
