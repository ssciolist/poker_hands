class Game
  attr_reader :scorekeeper
  def initialize
    @scorekeeper = Hash.new(0)
  end

  def play(file)
    File.open(file).each_line do |line|
      hand_array = line.chomp.split(" ")
      round = Round.new(hand_array)
      winner = round.winner
      @scorekeeper[winner] += 1
    end
  end

  # def player_1_wins
  #   @scorekeeper[:player_1]
  # end

end
