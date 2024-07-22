# Manage the state of the game, checking for win conditions and handling moves
class Computer
  attr_accessor :secret_code, :name

  def initialize
    @name = "Computer"
  end

  def rand_code
    COLOURS.sample(4)
  end
end
