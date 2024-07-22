# Orchestra the flow of the game, handles turns and checks for end of game
require_relative 'player'
COLOURS = %w[b g o p]

class GameController
  attr_accessor :guesser, :secret_code

  def initialize(player, computer)
    puts "Welcome #{player.name} to a new game of Mastermind"
    @computer1 = computer
    @player1 = player
    @secret_code = []
  end

  def play
    decide_mastermind
    
  end
    

  def decide_mastermind
    puts "Who will be the Mastermind i.e. person who creates the secret code ?"
    puts "enter c for computer OR m for myself"
    # to put logic for collect and check inputs, for now just assume it is computer first
    @secret_code = @computer1.rand_code # if decide_guesser == "computer"
    return @computer1.name
  end
end
