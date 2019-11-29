require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup 
    @song = Song.new("Fleetwood Mac", "Dreams")
  end



end
