class Round
  attr_reader :player_1,
              :player_2
              
  def initialize(hand_array)
    @player_1 = Hand.new(hand_array[0..4])
    @player_2 = Hand.new(hand_array[5..9])
  end
end
