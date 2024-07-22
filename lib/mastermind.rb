require_relative "computer"
require_relative "game_controller"
require_relative "player"
require "colorize"

computer = Computer.new
player = Player.new
game = GameController.new(player, computer)
game.play

##select who guess
# puts " Who will be the code maker? Type 'me' to be the code maker or 'com' for the computer to be the code maker'
# codemaker = gets.chomp.lowercase.to_i
# codermaker.check valid ?

# #check valid selection for guesses?
# if "me" human 
# if "com" computer
# else redo select guess

# #manually select secret code if human is generating