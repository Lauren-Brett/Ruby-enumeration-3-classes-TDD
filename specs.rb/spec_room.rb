require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("E", "hello")
    @song1 = Song.new("F", "hi")
    @song1 = Song.new("Y", "what")
    @song1 = Song.new("U", "ye")

    @songs = [@song1, @song2, @song3, @song4]

    @room = Room.new("The 80s", 4, 0, 60, @songs)

    @guest1 = Guest.new("Zoe", 50)
    @guest1 = Guest.new("Jade", 100)
    @guest2 = Guest.new("Ruby", 80)
    @guest3 = Guest.new("Gem", 50)
    @guest4 = Guest.new("Rob", 100)
  end


  def test_check_capacity_of_room
    assert_equal(4, @room.capacity)
  end

  def test_room_start_with_empty_till
    assert_equal(0, @room.till)
  end

  def test_room_has_a_timelimit_of_60_minutes
    assert_equal(60, @room.time_limit)
  end

end
