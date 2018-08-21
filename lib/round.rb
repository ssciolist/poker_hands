class Round
  attr_reader :player_1,
              :player_2

  def initialize(hand_array)
    @player_1 = Hand.new(hand_array[0..4])
    @player_2 = Hand.new(hand_array[5..9])
  end

  def winner
    if @player_1.score > @player_2.score
      "player_1"
    elsif @player_1.score < @player_2.score
      "player_2"
    else
      tiebreaker
    end
  end

  def tiebreaker
    if @player_1.tiebreaker > @player_2.tiebreaker
      "player_1"
    elsif @player_1.tiebreaker < @player_2.tiebreaker
      "player_2"
    elsif @player_1.numbers[4] > @player_2.numbers[4]
      "player_1"
    elsif @player_1.numbers[4] < @player_2.numbers[4]
      "player_2"
    else
      "super-duper-tie"
    end
  end
end
