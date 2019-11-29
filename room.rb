 class Room

attr_reader :name, :capacity, :till, :time_limit

  def initialize(name, capacity, till, time_limit, playlist = [])
     @name = name
     @capacity = 4
     @till = till
     @time_limit = 60
     @playlist = []
  end



end
