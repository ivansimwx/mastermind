require_relative "computer"
require_relative "game_controller"
require_relative "player"

computer = Computer.new
player = Player.new
game = GameController.new(player, computer)
game.play

# puts game.decide_mastermind
 puts game.secret_code
# puts player.guess_attempt

##select who guess
# puts " Who will be the code maker? Type 'me' to be the code maker or 'com' for the computer to be the code maker'
# codemaker = gets.chomp.lowercase.to_i
# codermaker.check valid ?

# #check valid selection for guesses?
# if "me" human 
# if "com" computer
# else redo select guess



# #manually selet secret code if human is generating


# #guess attempt
# puts "What is your guess?"
# puts "input the colours in sequence using the first letter"
# puts "there are only 4 colours, Blue, Green, Orange, Purple
# puts "for e.g. Blue, Green, Orange, Purple should be sent as "bgop"
# guess = gets.chomp
# check.guess
# guess.lowercase.to_i
# guess.split

# #check guess by human is valid
# guess only includes alphabets b,g,o,p
# if valid, guess count add by one and return true
# if not valid, puts "Your guess did not include the appropriate alphabets for colours" and redo guess

# #generate secret code if computer is generating
# array of 4 with each index being a random_from_4_colors (blue, green, orange purple)

# #manually selet secret code if human is generating


# #guess attempt
# puts "What is your guess?"
# puts "input the colours in sequence using the first letter"
# puts "there are only 4 colours, Blue, Green, Orange, Purple
# puts "for e.g. Blue, Green, Orange, Purple should be sent as "bgop"
# guess = gets.chomp
# check.guess
# guess.lowercase.to_i
# guess.split

# #check guess by human is valid
# guess only includes alphabets b,g,o,p
# if valid, guess count add by one and return true
# if not valid, puts "Your guess did not include the appropriate alphabets for colours" and redo guess

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
