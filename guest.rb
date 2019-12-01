class Guest

attr_reader :name, :wallet, :room1

def initialize(name, wallet)
  @name = name
  @wallet = wallet
  @room1 = room1
  # @fav_song = fav_song
end


def check_enough_money_to_sing(room)
  return @wallet >= room.price
end


def wallet_decreases(room)
  return @wallet -= room.price
end



end
