# Manage the state of the game, checking for win conditions and handling moves
class Computer
  attr_accessor :secret_code

  def initialize
    @secret_code = []
  end

  def rand_code
    COLOURS.sample(4)
  end
end
