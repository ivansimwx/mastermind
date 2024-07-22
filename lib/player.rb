# manage the player-specific information and moves
class Player
  attr_accessor :secret_code, :name, :guess_attempt

  def initialize
    @name = "Player 1"
  end

  def select_code
    puts "Please enter your secret code which must be made up of #{CODE_LENGTH} colours".colorize(color: :black, background: :white)
    puts "e.g. bgop will represent blue, green, orange, purple".colorize(color: :black, background: :white)
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(color: :black, background: :white)
    @secret_code = @colors.sample(CODE_LENGTH)
  end

  def guess_turn
    puts "\nEnter your guess which must be made up of #{CODE_LENGTH} colours".colorize(color: :black, background: :white)
    puts "e.g. bgop will represent blue, green, orange, purple".colorize(color: :black, background: :white)
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(color: :black, background: :white)
    @guess_attempt = gets.chomp.to_s.downcase.split('')
    # @guess_attempt if @guess_attempt.valid?
  end

  def valid?
    @count = 0
    @guess_attempt.each do |guess_colour|
      count += 1 if COLORS.any?(guess_colour)
    end
    @count == 4 ? true : false
  end
end
