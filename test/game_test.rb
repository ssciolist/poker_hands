require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/hand'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_can_play_game
    game = Game.new
    game.play("/Users/meganarellano/turing/mod5/poker-hands/poker.txt")

    assert_equal 1000, game.scorekeeper.values.sum
  end

  def test_it_can_assign_scores
    game = Game.new
    game.play("/Users/meganarellano/turing/mod5/poker-hands/poker.txt")

    assert_equal 376, game.scorekeeper["player_1"]
  end
end
