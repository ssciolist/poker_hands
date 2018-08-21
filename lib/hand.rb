class Hand
  attr_reader :numbers,
              :suits

  def initialize(card_array)
    @numbers = card_array.map {|card| card[0]}
    @suits = card_array.map {|card| card[1]}
  end
end
