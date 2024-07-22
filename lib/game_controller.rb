require_relative "player"
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
  end

  def play
    decide_mastermind
    guess_turn
    check_outcome
  end

  def decide_mastermind
    puts "\nWho will be the Mastermind i.e. person who creates the secret code ?".colorize(color: :black, background: :white)
    puts "enter c for computer OR m for myself".colorize(color: :black, background: :white)
    # to put logic for collect and check inputs, for now just assume it is computer first
    @secret_code = @computer1.rand_code # if decide_guesser == "computer"
    return @computer1.name
  end

  def guess_turn
    # if human is guesser
    loop do
      @player1.guess_get
      break if @player1.valid?
    end
  end
end
