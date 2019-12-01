require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @song = Song.new("Fleetwood Mac", "Dreams", 5)
    @song1 = Song.new("Lorde vs Biggie", "Can i", 6)
    @song2 = Song.new("Major Lazer", "Original Don", 10)
    @song3 = Song.new("Queen", "Killer Queen", 10)
    @song4 = Song.new("Poolside", "Harvest Moon", 4)
  end

def test_song_has_title
  result = @song.title_of_song(@song2)
  assert_equal("Original Don", result)
end

end
