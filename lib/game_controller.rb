require_relative "player"
require_relative "computer"
COLOURS = %w[b g o p]
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
    decide_mastermind
    loop do
      guess_turn
      break if game_end?

      feedback_guess
    end
  end

  def decide_mastermind
    puts "\nWho will be the Mastermind i.e. person who creates the secret code ?".colorize(color: :black, background: :white)
    puts "enter c for computer OR m for myself".colorize(color: :black, background: :white)
    # to put logic for collect and check inputs, for now just assume it is computer first
    @secret_code = @computer1.rand_code # if decide_guesser == "computer"
    @computer1.name
  end

  def guess_turn
    # if human is guesser
    loop do
      @player1.guess_get
      break if @player1.valid?
    end
  end

  def game_end?
    if @player1.guess_attempt == @secret_code
      puts "\n#{@player1.name} has won!".colorize(color: :white, background: :green)
      true
    elsif @round == 12
      puts "\n#{@player1.name} has lost!".colorize(color: :white, background: :red)
      true
    elsif @round < 12
      puts "\nYou have #{12-@round} more guess(es)".colorize(:green)
      @round += 1
      false
    end
  end

  def check_peg
    @total_peg = 0
    @white_peg = 0
    @black_peg = 0
    @player1.guess_attempt.each_with_index do |guess_colour, position|
      @total_peg += 1 if @secret_code.any?(guess_colour)
      @white_peg += 1 if @player1.guess_attempt[position] == @secret_code[position]
    end
    @black_peg = @total_peg - @white_peg
  end

  def feedback_guess
    check_peg
    puts "Feedback on your guess".colorize(color: :white, background: :green)
    puts "White: #{@white_peg} (White means right colour and position)".colorize(color: :black, background: :white)
    puts "Black: #{@black_peg} (Black means right colour but wrong position)".colorize(color: :white, background: :black)
  end
end
