class Hand
  attr_reader :numbers,
              :suits

  def initialize(card_array)
    @numbers = card_num_sort(card_array.map {|card| card[0]})
    @suits = card_array.map {|card| card[1]}
  end

  def card_num_sort(card_numbers_array)
    card_numbers_array.map do |number|
      number.to_i
    end
  end

  def face_card_values
    {"J": 11,
     "Q": 12,
     "K": 13,
     "A": 14}
  end
end
