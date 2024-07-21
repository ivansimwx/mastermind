# Manage the state of the game, checking for win conditions and handling moves
class Computer
  attr_accessor :secret_code

  def initialize
    @secret_code = []
    @colors = %w[b g o p]
  end

  def rand_code
    @secret_code = @colors.sample(4)
  end

  def player_code
end

new_board = Board.new
new_board.rand_code
puts new_board.secret_code