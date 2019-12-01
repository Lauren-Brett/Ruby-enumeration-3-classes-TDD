require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Jade", 100)
    @guest2 = Guest.new("Ruby", 80)
    @guest3 = Guest.new("Gem", 50)
    @guest4 = Guest.new("Rob", 10)

    @room1 = Room.new("The Pretenders", 0, 60, 20, [@song1, @song2, @song3, @song4] )
    # @fav_song = fav_song
  end


def test_guest_name
  assert_equal("Gem", @guest3.name)
end


def test_guest_has_money_in_wallet
  assert_equal(100, @guest1.wallet)
end


def test_enough_money_to_afford_karaoke
  assert_equal(true, @guest1.check_enough_money_to_sing(@room1))
end


def test_not_enough_money_to_afford_karaoke
  assert_equal(false, @guest4.check_enough_money_to_sing(@room1))
end


def test_wallet_decreases_when_guest_rents_room
  assert_equal(60, @guest2.wallet_decreases(@room1))
end


end
