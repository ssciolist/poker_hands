require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/hand'

class RoundTest < Minitest::Test
  def test_it_inits_with_p1_p2
    hand_array = ["8C", "TS", "KC", "9H", "4S", "7D", "2S", "5D", "3S", "AC"]
    round = Round.new(hand_array)

    assert_instance_of Hand, round.player_1
    assert_instance_of Hand, round.player_2
  end
end
