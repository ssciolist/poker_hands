class Hand
  attr_reader :numbers,
              :suits

  def initialize(card_array)
    unsorted_card_numbers = card_array.map {|card| card[0]}
    @numbers = card_num_sort(unsorted_card_numbers)
    @suits = card_array.map {|card| card[1]}
  end

  def card_num_sort(card_numbers_array)
    card_numbers_array.map do |number|
      if face_card_values[number.to_sym]
        face_card_values[number.to_sym]
      else
        number.to_i
      end
    end.sort
  end

  def face_card_values
    {"J": 11,
     "Q": 12,
     "K": 13,
     "A": 14}
  end
end
