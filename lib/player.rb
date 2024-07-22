# manage the player-specific information and moves
class Player
  attr_accessor :name
  attr_reader :input_code

  def initialize
    @name = "Player 1"
  end

  def input_code
    loop do
      puts "Please enter your secret code which must be made up of #{CODE_LENGTH} colours".colorize(INSTRUCTION_COLOUR)
      puts "e.g. bgop will represent blue, green, orange, purple".colorize(INSTRUCTION_SUB_COLOUR)
      puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(INSTRUCTION_SUB_COLOUR)
      @input_code = gets.chomp.to_s.chars
      break if valid_code?(@input_code)
    end
    @input_code
  end

  def guess_get
    puts "\nEnter your guess which must be made up of #{CODE_LENGTH} colours".colorize(INSTRUCTION_COLOUR)
    puts "e.g. bgop will represent blue, green, orange, purple".colorize(INSTRUCTION_SUB_COLOUR)
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(INSTRUCTION_SUB_COLOUR)
    gets.chomp.to_s.downcase.chars
  end
end
