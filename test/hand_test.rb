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

  def test_it_scores_hands
    rf = Hand.new(["TH", "JH", "QH", "KH", "AH"])
    sf = Hand.new(["4S", "5S", "6S", "7S", "8S"])
    four_kind = Hand.new(["4S", "4H", "4D", "4C", "6S"])

    assert_equal 9, rf.score
    assert_equal 8, sf.score
    assert_equal 7, four_kind.score
  end

  def test_it_can_find_same_suits
    hand = Hand.new(["TH", "JH", "QH", "KH", "AH"])

    assert hand.same_suit?
  end

  def test_it_can_find_a_royal_flush
    hand = Hand.new(["TH", "JH", "QH", "KH", "AH"])

    assert hand.royal_flush
  end

  def test_it_can_find_a_straight_flush
    hand = Hand.new(["4S", "5S", "6S", "7S", "8S"])

    assert hand.straight_flush
  end

end
