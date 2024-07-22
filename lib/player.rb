# manage the player-specific information and moves
class Player
  attr_accessor :secret_code, :name, :guess_attempt

  def initialize
    @name = "Player 1"
  end

  def input_code
    loop do
    puts "Please enter your secret code which must be made up of #{CODE_LENGTH} colours".colorize(color: :black, background: :white)
    puts "e.g. bgop will represent blue, green, orange, purple".colorize(color: :black, background: :white)
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(color: :black, background: :white)
    @secret_code = gets.chomp.to_s.chars
    # puts @secret_code
    break if valid_code?(@secret_code)
    end
    @secret_code
  end

  def guess_get
    puts "\nEnter your guess which must be made up of #{CODE_LENGTH} colours".colorize(color: :black, background: :white)
    puts "e.g. bgop will represent blue, green, orange, purple".colorize(color: :black, background: :white)
    puts "Colours can be repeated and you can only choose from blue, green, orange and purple".colorize(color: :black, background: :white)
    @guess_attempt = gets.chomp.to_s.downcase.chars
  end

  def valid_code?(code_array)
    @count = 0
    code_array.each do |guess_colour|
      @count += 1 if COLOURS.any?(guess_colour)
    end
    if @count == 4
      true
    else
      puts "\nYou have provided an invalid guess. Please try again".colorize(color: :white, background: :red)
      false
    end
  end
end
