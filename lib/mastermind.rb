require_relative "computer"
require_relative "game_controller"
require_relative "player"
require "colorize"

computer = Computer.new
player = Player.new
game = GameController.new(player, computer)
game.play
