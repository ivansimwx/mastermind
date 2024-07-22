require_relative "computer"
require_relative "game_controller"
require_relative "player"
require 'colorize'

computer = Computer.new
player = Player.new
game = GameController.new(player, computer)
game.play

# puts game.decide_mastermind
# puts game.secret_code
# puts player.guess_attempt

##select who guess
# puts " Who will be the code maker? Type 'me' to be the code maker or 'com' for the computer to be the code maker'
# codemaker = gets.chomp.lowercase.to_i
# codermaker.check valid ?

# #check valid selection for guesses?
# if "me" human 
# if "com" computer
# else redo select guess

# #manually select secret code if human is generating

# #check outcome?
# - if <12 guesses and guess is correct, puts "victory message"
# -if 12 guesses and guess is incorrect, puts "loss message"

# #feedback guess
# feedback_arr = []
# check how many colours are present
# for every colour in the guess that is present and in the right position, increase black peg number
#     for every color in the guess that is present but in the right position, increase white peg
# append black peg and white peg to feedback_arr
# print feedback_arr.join

# loop
# #new game created + intro
# #guess attempt
# #check guess
# #check outcome?
# - if <12 guesses and guess is correct
# -if not, feedback guess
