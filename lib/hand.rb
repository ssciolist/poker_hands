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
    same_suit?
  end

  def four_of_a_kind
    @numbers.find_all{ |num| @numbers.count(num) == 4 }.uniq.count == 1
  end

  def full_house
    three_of_a_kind && pair
  end

  def three_of_a_kind
    multiples(3)
  end

  def two_pair
    multiples(2, 2)
  end

  def pair
    multiples(2, 1)
  end

  def multiples(of_a_kind, freq = 1)
    @numbers.find_all{ |num| @numbers.count(num) == of_a_kind }.uniq.count == freq
  end

  def tiebreaker
    if royal_flush || straight_flush || flush || straight
      @numbers[4]
    elsif four_of_a_kind
      num = @numbers.find{ |num| @numbers.count(num) == 4 }
    elsif full_house || three_of_a_kind
      num = @numbers.find{ |num| @numbers.count(num) == 3 }
    elsif two_pair
      num = @numbers.find_all{ |num| @numbers.count(num) == 2 }.max
    elsif pair
      num = @numbers.find{ |num| @numbers.count(num) == 2 }
    else
      @numbers[4]
    end
  end

end
