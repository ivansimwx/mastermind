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
    @computer1 = computer
    @player1 = player
    @secret_code = []
    @round = 1
  end

  def play
    loop do
      ask_codemaker
      break if valid_codemaker?(gets.chomp.to_s)
    end
    puts "\nCodemaker is #{@codemaker.name}".colorize(color: :green, background: :black)
    @secret_code = @codemaker == @computer1 ? @computer1.rand_code : @player1.input_code
    puts "secret code is #{@secret_code}"
    loop do
      guess_turn
      break if game_end?(@codemaker.guess_attempt)

      if @solver == @player1
        feedback_guess
      else
        puts "#{@solver.name} has guessed #{@solver.guess_attempt}"
      end
    end
  end

  def ask_codemaker
    puts "\nWho will be the Codemaker i.e. person who creates the secret code ?".colorize(color: :black, background: :white)
    puts "enter c for computer OR m for myself".colorize(color: :black, background: :white)
    # to put logic for collect and check inputs, for now just assume it is computer first
  end

  def valid_codemaker?(select_string)
    if CODEMAKER_OPTIONS.any?(select_string)
      if select_string == "m"
        @codemaker = @player1
        @solver = @computer1
      else
        @codemaker = @computer1
        @solver = @player1
      end
      true
    else
      puts "You have provided an invalid selection. Please try again"
    end
  end

  def guess_turn
    if @codemaker == @computer1
      loop do
        @player1.guess_get
        break if @player1.valid_code?(@player1.guess_attempt)
      end
    else
      @computer1.rand_guess
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

  def feedback_guess
    puts "Feedback on your guess".colorize(color: :white, background: :green)
    check_peg
  end

  def check_peg
    check_total_peg
    check_white_peg
    check_black_peg
  end

  def check_total_peg
    @total_peg = 0
    temp_code = @secret_code.dup
    @player1.guess_attempt.each do |guess_colour|
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
    @player1.guess_attempt.each_with_index do |guess_colour, position|
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
