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
    {"T": 10,
     "J": 11,
     "Q": 12,
     "K": 13,
     "A": 14}
  end

  def score
    if royal_flush
      9
    elsif straight_flush
      8
    elsif four_of_a_kind
      7
    elsif full_house
      6
    elsif flush
      5
    elsif straight
      4
    elsif three_of_a_kind
      3
    elsif two_pair
      2
    elsif pair
      1
    else
      0
    end
  end

  def same_suit?
    @suits.uniq.count == 1
  end

  def royal_flush
    same_suit? && straight && @numbers[0] == 10
  end

  def straight_flush
    same_suit? && straight
  end

  def straight
    @numbers.sort.each_cons(2).all? { |first_card, second_card| second_card == first_card + 1 }
  end

  def flush
    require 'pry'; binding.pry
    same_suit?
  end

  def four_of_a_kind
    @numbers.find{ |num| @numbers.count(num) == 4 }
  end

  def full_house
    three_of_a_kind && pair
  end

  def three_of_a_kind
    @numbers.find{ |num| @numbers.count(num) == 3 }
  end

  def pair
    @numbers.find{ |num| @numbers.count(num) == 2 }
  end

end
