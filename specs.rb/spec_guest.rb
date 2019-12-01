require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../guest')
require_relative('../song')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Jade", 100)
    @guest2 = Guest.new("Ruby", 80)
    @guest3 = Guest.new("Gem", 50)
    @guest4 = Guest.new("Rob", 100)
    @fav_song = fav_song
  end

end
