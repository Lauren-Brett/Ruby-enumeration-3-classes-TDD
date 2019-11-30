 class Room

attr_reader :name, :till, :time_limit

  def initialize(name, capacity, till, time_limit)
     @name = name
     @capacity = capacity
     @till = till
     @time_limit = 60
     @occupancy = []
     # @playlist = playlist
  end


def guest_counter()
  return @occupancy.length
end


def capacity
  if @capacity == 4
    return "Room Full"
  end
end

def increse_number_of_guests(new_guest)
  return @occupancy.push(new_guest)
end

def decrease_number_guests(guest_finished)
  return @occupancy.delete(guest_finished)
end


# def room_is_full?
#   if @occupencey == @capacity
#   end
# end



end
