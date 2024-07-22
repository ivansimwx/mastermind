require_relative "player"
require_relative "computer"
COLOURS = %w[b g o p]
CODEMAKER_OPTIONS = %w[c m]
CODE_LENGTH = 4
ERROR_COLOUR = :red
INFO_COLOUR = { color: :blue, background: :white }
SUCCESS_COLOUR = :green
INSTRUCTION_COLOUR = { color: :black, background: :yellow }
INSTRUCTION_COLOUR2 = { color: :black, background: :cyan }
INSTRUCTION_SUB_COLOUR = :default
BOARD_COLOUR = { color: :black, background: :white }
# WHITE_PEG_COLOUR = { color: :cyan, background: :white }
# BLACK_PEG_COLOUR = { color: :cyan, background: :black }

# Orchestra the flow of the game, handles turns and checks for end of game
class GameController
  attr_accessor :guesser, :secret_code

  def initialize(player, computer)
    puts "\nWelcome to a new game of Mastermind".white.on_black.blink
    @secret_code = []
    @round = 1
    @codemaker = @computer1 = computer
    @solver = @player1 = player
    @guess_attempt = []
    @board = []
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
      puts "\nWho will be the Codemaker i.e. person who creates the secret code?".colorize(INSTRUCTION_COLOUR)
      puts "enter c for computer OR m for myself".colorize(INSTRUCTION_SUB_COLOUR)
      break if valid_codemaker?(gets.chomp.to_s)
    end
    puts "\n Codemaker is #{@codemaker.name} ".colorize(INFO_COLOUR)
    puts "\n Solver is #{@solver.name} ".colorize(INFO_COLOUR)
  end

  def valid_codemaker?(select_string)
    if CODEMAKER_OPTIONS.any?(select_string)
      if select_string == "m" # default intialize assumes codemaker is computer
        @codemaker = @player1
        @solver = @computer1
      end
      true
    else
      puts "You have provided an invalid selection. Please try again".colorize(ERROR_COLOUR)
    end
  end

  def decide_code
    @secret_code = @codemaker == @computer1 ? @codemaker.rand_code : @codemaker.input_code
    # puts "secret code is #{@secret_code}"
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
      puts "\nYou have provided an invalid guess. Please try again".colorize(ERROR_COLOUR)
      false
    end
  end

  def game_end?(guess_array)
    if guess_array == @secret_code
      puts "\n#{@solver.name} has won in #{@round} round(s)!".colorize(SUCCESS_COLOUR)
      true
    elsif @round == 12
      puts "\n#{@solver.name} has lost!".colorize(ERROR_COLOUR)
      puts "\n The secret code is #{@secret_code}"
      true
    elsif @round < 12
      puts "\n#{@solver.name} has #{12-@round} more guess(es)".colorize(INFO_COLOUR)
      @round += 1
      false
    end
  end

  def feedback
    if @solver == @player1
      #puts "\nFeedback on your latest guess".colorize(INSTRUCTION_COLOUR2)
      #puts "Your guess is #{@guess_attempt}".colorize(INSTRUCTION_COLOUR2)
      feedback_peg
    else
      puts "#{@solver.name} has guessed #{@guess_attempt}"
    end
  end

  def feedback_peg
    check_total_peg
    check_white_peg
    check_black_peg
    @board.push([@guess_attempt, @white_peg, @black_peg])
    puts "\nFeedback of your guesses".colorize(INSTRUCTION_COLOUR2)
    @board.each_with_index do |attempt, index|
      puts "Round #{index + 1}: #{attempt[0]} White: #{attempt[1]}, Black: #{attempt[2]}".colorize(BOARD_COLOUR)
    end
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
    #puts "White: #{@white_peg} (White means right colour and position)".colorize(color: :black, background: :white)
  end

  def check_black_peg
    @black_peg = 0
    @black_peg = @total_peg - @white_peg
    #puts "Black: #{@black_peg} (Black means right colour but wrong position)".colorize(color: :white, background: :black)
  end
end
