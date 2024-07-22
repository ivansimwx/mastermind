# manage the player-specific information and moves
class Player
  attr_accessor :secret_code, :name

  def initialize
    @name = "Player 1"
  end

  def select_code
    puts "Please enter your secret code which must be made up of 4 colours"
    puts "e.g. bgop will represent blue, green, orange, purple"
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple"
    @secret_code = @colors.sample(4)
  end
end
