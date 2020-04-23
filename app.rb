require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

puts "\n"
puts "On va jouer au jeu du morpion !"
puts "\n"

intro_players

show_board(board)

play(board)

puts "\n"
puts "Vous pouvez rejouer une partie si vous le souhaitez."
puts "\n"









