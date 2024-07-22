# manage the player-specific information and moves
class Player
  attr_accessor :secret_code, :name, :guess_attempt

  def initialize
    @name = "Player 1"
  end

  def select_code
    puts "Please enter your secret code which must be made up of 4 colours"
    puts "e.g. bgop will represent blue, green, orange, purple"
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple"
    @secret_code = @colors.sample(4)
  end

  def guess_turn
    puts "Enter your guess which must be made up of 4 colours"
    puts "e.g. bgop will represent blue, green, orange, purple"
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple"
    @guess_attempt = []
    @guess_attempt = gets.chomp.to_s.downcase.split('')
    # @guess_attempt if @guess_attempt.valid?
  end

  def valid?
    if @guess_attempt == true
      @guess_attempt
    else
      "You have provided an invalid guess. Please try again."
    end
  end
end
