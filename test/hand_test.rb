require 'minitest/autorun'
require 'minitest/pride'
require './lib/hand'

class HandTest < Minitest::Test
  def test_it_inits_with_num_and_suit_attrs
    hand = Hand.new(["KH", "4H", "AS", "JS", "KS"])

    assert_equal ["H", "H", "S", "S", "S"], hand.suits
    assert_equal [4, 11, 13, 13, 14], hand.numbers
  end

  def test_it_sorts_hand_numbers
    hand = Hand.new(["KH", "4H", "AS", "JS", "KS"])


    assert_equal [4, 11, 13, 13, 14], hand.numbers
  end

  def test_it_scores_hand
    hand = Hand.new(["TH", "JH", "QH", "KH", "AH"])

    assert_equal 9, hand.score
  end
end
