require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/hand'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_can_play_game
    game = Game.new
    game.play("/Users/meganarellano/turing/mod5/poker-hands/poker.txt")
  end
end
