class Room


  ##### The room has a name to identify it specifically. It has a till in order to take payments from guests.
  # To hire a room costs $20 per hour. After one hour, guests are asked to leave as time is up!
  # When a room becomes full it has reached its capacity of 4 guests at any one time.
  # One way to check how long the guests have been in the room, is to check the length of all the songs they played in
  # in their playlist and then we can know if the time limit has been reached (yep, fully aware bit odd in reality, but
  # it helped me practise and get my head around certain tasks!! )




  attr_reader :name, :till, :price, :capacity

  def initialize(name, till, time_limit, price, songs_array = [] )
    @name = name
    @till = till
    @time_limit = 60
    @price = 20
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


  def song_list_counter()
    # binding.pry
    return @songs.length
  end

  def song_by_artist(specific_song)
    @songs.find { |song| song.artist == specific_song}
  end

  def song_by_time_in_mins(song_time)
    @songs.find { |song| song.time_of_song == song_time}
  end

  def total_all_song_times
    # binding.pry
    total_time_of_playlist = @songs.map { |song| song.time_of_song}
    sum_all = total_time_of_playlist.reduce { | total_time, current_time| total_time + current_time }
    return sum_all
  end


  def time_limit
    if @time_limit >= 60
      return "Time up!"
    else
      return "Keep going, embarrass yourselves more..."
    end
  end


  def add_song_to_playlist(new_song)
    return @songs.push(new_song)
  end


  def check_total_length_of_songs_equals_time_up(songs_array)
    if @songs.length(songs_array)
      if @songs.length(songs_array)
        if @songs.total_all_song_times
          @songs.time_limit
        end
      end
    end
  end


  def ask_guest_to_pay(guest, room)
    if guest.check_enough_money_to_sing(room) == true
      return true
    else
      return false
    end
  end

def till_increases_as_guest_pays(room)
  return @till += room.price
end


end
