require_relative "player"
require_relative "computer"
COLOURS = %w[b g o p]
CODEMAKER_OPTIONS = %w[c m]

CODE_LENGTH = 4

# Orchestra the flow of the game, handles turns and checks for end of game
class GameController
  attr_accessor :guesser, :secret_code

  def initialize(player, computer)
    puts "\nWelcome #{player.name} to a new game of Mastermind".black.on_white.blink
    @secret_code = []
    @round = 1
    @codemaker = @computer1 = computer
    @solver = @player1 = player
    @guess_attempt = []
  end

  def play
    decide_codemaker
    decide_code
    loop do
      guess_turn
      break if game_end?(@guess_attempt)

      feedback
    end
  end

  def decide_codemaker
    loop do
      puts "\nWho will be the Codemaker i.e. person who creates the secret code ?".colorize(color: :black, background: :white)
      puts "enter c for computer OR m for myself".colorize(color: :black, background: :white)
      break if valid_codemaker?(gets.chomp.to_s)
    end
    puts "\nCodemaker is #{@codemaker.name}".colorize(color: :green, background: :black)
  end

  def valid_codemaker?(select_string)
    if CODEMAKER_OPTIONS.any?(select_string)
      if select_string == "m" # default intialize assumes codemaker is computer
        @codemaker = @player1
        @solver = @computer1
      end
      true
    else
      puts "You have provided an invalid selection. Please try again"
    end
  end

  def decide_code
    @secret_code = @codemaker == @computer1 ? @codemaker.rand_code : @codemaker.input_code # @computer1.rand_code : @player1.input_code
    puts "secret code is #{@secret_code}"
  end

  def guess_turn
    if @solver == @player1
      loop do
        @guess_attempt = @solver.guess_get
        break if valid_code?(@guess_attempt)
      end
    else
      @guess_attempt = @solver.rand_guess
    end
  end

  def valid_code?(guess_array)
    count = 0
    guess_array.each do |guess_colour|
      count += 1 if COLOURS.any?(guess_colour)
    end
    if count == 4
      true
    else
      puts "\nYou have provided an invalid guess. Please try again".colorize(color: :white, background: :red)
      false
    end
  end

  def game_end?(guess_array)
    if guess_array == @secret_code
      puts "\n#{@solver.name} has won in #{@round} round(s)!".colorize(color: :white, background: :green)
      true
    elsif @round == 12
      puts "\n#{@solver.name} has lost!".colorize(color: :white, background: :red)
      puts "\n The secret code is #{@secret_code}"
      true
    elsif @round < 12
      puts "\n#{@solver.name} has #{12-@round} more guess(es)".colorize(:green)
      @round += 1
      false
    end
  end

  def feedback
    if @solver == @player1
      puts "Feedback on your guess".colorize(color: :white, background: :green)
      feedback_peg
    else
      puts "#{@solver.name} has guessed #{@guess_attempt}"
    end
  end

  def feedback_peg
    check_total_peg
    check_white_peg
    check_black_peg
  end

  def check_total_peg
    @total_peg = 0
    temp_code = @secret_code.dup
    @guess_attempt.each do |guess_colour|
      temp_code.each_with_index do |code_colour, position|
        next unless guess_colour == code_colour

        @total_peg += 1
        temp_code.delete_at(position)
        break
      end
    end
  end

  def check_white_peg
    @white_peg = 0
    @guess_attempt.each_with_index do |guess_colour, position|
      @white_peg += 1 if guess_colour == @secret_code[position]
    end
    puts "White: #{@white_peg} (White means right colour and position)".colorize(color: :black, background: :white)
  end

  def check_black_peg
    @black_peg = 0
    @black_peg = @total_peg - @white_peg
    puts "Black: #{@black_peg} (Black means right colour but wrong position)".colorize(color: :white, background: :black)
  end
end
