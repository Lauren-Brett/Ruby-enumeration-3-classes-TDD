require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("Lorde vs Biggie", "Can i", 6)
    @song2 = Song.new("Major Lazer", "Original Don", 10)
    @song3 = Song.new("Queen", "Killer Queen", 10)
    @song4 = Song.new("Poolside", "Harvest Moon", 5)
    @song5 = Song.new("Crazy", "Beyonce", 30)
    # @playlist = [@song1, @song2, @song3, @song4]

    @room1 = Room.new("The Pretenders", 0, 60, 20, [@song1, @song2, @song3, @song4] )
    #(name, till, time_limit)
    @guest1 = Guest.new("Zoe", 50)
    @guest2 = Guest.new("Jade", 100)
    @guest3 = Guest.new("Ruby", 80)
    @guest4 = Guest.new("Gem", 50)
    @guest5 = Guest.new("Rob", 10)
  end


  def test_room_name
    assert_equal("The Pretenders", @room1.name)
  end


  def test_room_has_a_price_of_20_per_hour
    assert_equal(20, @room1.price)
  end


  def test_room_start_with_empty_till
    assert_equal(0, @room1.till)
  end

  # def test_room_has_a_timelimit_of_60_minutes
  #   assert_equal(60, @room1.time_limit)
  # end

  def test_room_counter_starts_at_zero_guests
    assert_equal(0, @room1.guest_counter)
  end


  def test_add_one_guest_to_room
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


  # def test_room_occupency
  #   assert_equal(0, @room1.occupancy)
  # end

  # def test_room_occupency_increases_with_guests_added
  #   @room1.increse_number_of_guests(@guest1)
  #   update_occupancy = @room1.occupancy
  #   assert_equal(1, @room1.update_occupancy)
  # end


  def test_check_max_capacity_of_room_has_been_reached
    @room1.increse_number_of_guests(@guest1)
    @room1.increse_number_of_guests(@guest2)
    @room1.increse_number_of_guests(@guest3)
    @room1.increse_number_of_guests(@guest4)
    @room1.increse_number_of_guests(@guest5)
    @room1.guest_counter
    assert_equal(5, @room1.guest_counter)
    assert_equal(true, @room1.capacity)
  end


  def test_check_capacity_of_room_has_not_been_reached
    @room1.increse_number_of_guests(@guest1)
    @room1.increse_number_of_guests(@guest2)
    @room1.increse_number_of_guests(@guest3)
    @room1.guest_counter
    assert_equal(3, @room1.guest_counter)
    assert_equal("Still Space!", @room1.capacity)
  end


  def test_songs_in_playlist
    @room1.song_list_counter
    assert_equal(4, @room1.song_list_counter)
  end


  def test_get_song_by_name_of_artist
    result = @room1.song_by_artist("Poolside")
    assert_equal(@song4, result)
  end


  def test_length_of_individual_songs
    result = @room1.song_by_time_in_mins(10)
    assert_equal(@song2, result)
  end


  def test_get_total_of_all_song_times_in_mins
    result = @room1.total_all_song_times
    assert_equal(31, result)
  end


  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song5)
    assert_equal(5, @room1.song_list_counter)
  end

  # def test_increase_total_time_of_playlist_when_song_added
  #   @room1.increase_total_time_of_playlist(@song5)
  #   assert_equal(61, @room1.total_all_song_times)
  # end


  # I know this test below is a little questionable in real life and in why im
  #doing it, but doing it to practice :)

  def test_time_limit_is_up_when_60_mins_has_passed_due_to_playlist
    @room1.add_song_to_playlist(@song5)
    assert_equal(5, @room1.song_list_counter)
    assert_equal(61, @room1.total_all_song_times)
    assert_equal("Time up!", @room1.time_limit)
  end


  def test_guest_has_enough_money_to_afford_the_room
    assert_equal(true, @room1.ask_guest_to_pay(@guest1, @room1))
    assert_equal(false, @room1.ask_guest_to_pay(@guest5, @room1))
  end


def test_till_increases_as_guest_pays
  @room1.till_increases_as_guest_pays(@room1)
  assert_equal(20, @room1.till)
end


end
