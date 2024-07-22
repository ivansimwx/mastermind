# manage the player-specific information and moves
class Player
  attr_accessor :name
  attr_reader :input_code

  def initialize
    @name = "Player 1"
  end

  def input_code
    loop do
      puts "Please enter your secret code which must be made up of #{CODE_LENGTH} colours".colorize(color: :black, background: :white)
      puts "e.g. bgop will represent blue, green, orange, purple".colorize(color: :black, background: :white)
      puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(color: :black, background: :white)
      @input_code = gets.chomp.to_s.chars
      break if valid_code?(@input_code)
    end
    @input_code
  end

  def guess_get
    puts "\nEnter your guess which must be made up of #{CODE_LENGTH} colours".colorize(color: :black, background: :white)
    puts "e.g. bgop will represent blue, green, orange, purple".colorize(color: :black, background: :white)
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(color: :black, background: :white)
    gets.chomp.to_s.downcase.chars
  end
end
