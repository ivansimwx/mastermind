# Manage the state of the game, checking for win conditions and handling moves
class Computer
  attr_accessor :secret_code, :name, :guess_attempt

  def initialize
    @name = "Computer"
  end

  def rand_code
    # COLOURS.sample(CODE_LENGTH)
    CODE_LENGTH.times.map{ COLOURS.sample}
  end

  def rand_guess
    # @guess_attempt = COLOURS.sample(CODE_LENGTH)
    @guess_attempt = CODE_LENGTH.times.map{ COLOURS.sample}
  end
end
