# Manage the state of the game, checking for win conditions and handling moves
class Computer
  attr_reader :name

  def initialize
    @name = "Computer"
  end

  def rand_code
    Array.new(CODE_LENGTH) { COLOURS.sample } 
    # alternative CODE_LENGTH.times.map{ COLOURS.sample}
    # COLOURS.sample(CODE_LENGTH) would create a unique set of values i.e. no duplicates which Mastermind allows for
  end

  def rand_guess
    Array.new(CODE_LENGTH) { COLOURS.sample }
  end
end
