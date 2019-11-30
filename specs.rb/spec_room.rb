require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup
    # @song1 = Song.new("E", "hello")
    # @song1 = Song.new("F", "hi")
    # @song1 = Song.new("Y", "what")
    # @song1 = Song.new("U", "ye")
    #
    # @songs = [@song1, @song2, @song3, @song4]

    @room1 = Room.new("The 80s", 4, 0, 60)

# (name, capacity, till, time_limit)

  @guest1 = Guest.new("Zoe", 50)
  @guest2 = Guest.new("Jade", 100)
  @guest3 = Guest.new("Ruby", 80)
  @guest4 = Guest.new("Gem", 50)
  @guest5 = Guest.new("Rob", 100)
  end


  def test_check_capacity_of_room
    assert_equal("Room Full", @room1.capacity)
  end

  def test_room_start_with_empty_till
    assert_equal(0, @room1.till)
  end

  def test_room_has_a_timelimit_of_60_minutes
    assert_equal(60, @room1.time_limit)
  end


  def test_room_counter_starts_at_zero_guests
    assert_equal(0, @room1.guest_counter)
  end

  def test_add_guest_to_room_occupancy_by_1
    @room1.increse_number_of_guests(@guest1)
    assert_equal(1, @room1.guest_counter)
  end

def test_add_multiple_guests_to_room
    @room1.increse_number_of_guests(@guest1)
    @room1.increse_number_of_guests(@guest2)
    @room1.increse_number_of_guests(@guest3)
    assert_equal(3, @room1.guest_counter)
end

def test_remove_guest_from_room
  @room1.increse_number_of_guests(@guest1)
  @room1.increse_number_of_guests(@guest2)
  @room1.decrease_number_guests(@guest1)
  assert_equal(1, @room1.guest_counter)
end

# def test_when_occupancy_equals_capacity_display_room_full
#   room_is_full = @room1.occupancy
#   assert_equal(true, @room1.room_is_full)
# end




end
