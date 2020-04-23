require 'bundler'
Bundler.require

require_relative 'player'

WIN_COMBOS = [
  [0, 1, 2], # ligne du haut
  [3, 4, 5], # ligne du milieu 
  [6, 7, 8], # ligne bu bas
  [0, 3, 6], # colonne de gauche 
  [1, 4, 7], # colonne du centre
  [2, 5, 8], # colonne de droite 
  [0, 4, 8], # diagonale descendante
  [6, 4, 2]  # diagonale ascendante 
] # WIN_COMBOS est une constante => s'écrit tout en majuscules

# Présentation des joueurs 

def intro_players
	puts "Quel est le prénom du 1er joueur ?"
	print "> "
	player1_name = gets.chomp
	player1 = Player.new(player1_name, "X")
	puts "\n"
	puts "Quel est le prénom du 2eme joueur ?"
	print "> "
	player2_name = gets.chomp
	player2 = Player.new(player2_name, "0")
end

# Affichage du tableau 

 def show_board(board)
 	 puts "\n"
 	 puts "Voici la grille de jeu :"
 	 puts "\n"
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-" * 11
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-" * 11
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
   puts "\n"
end

# Le joueur choisit une case (ce qui revient à choisir un chiffre)
def choice_to_index(player_choice)
	player_choice.to_i - 1
end

# Action du joueur 
def move(board, index, player)
	board[index] = player
end

# Case déjà occupée ? 
def position_taken?(board, index)
	if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
		return false
	else 
		return true # il y a un "X" ou un "O" sur la case 
	end
end

# Coup valide ? (l'index est entre 0 et 8; et la case n'est pas occupée)
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
  	return true
  end
end

# On joue un tour 
def turn(board)
	puts "A toi de jouer !"
	puts "Choisis un chiffre entre 1 et 9. La grille se lit de gauche à droite et de haut en bas."
	puts "\n"
	player_choice = gets.chomp 
	index = choice_to_index(player_choice)
	if valid_move?(board, index)
		move(board, index, current_player(board))
	else 
		turn(board)
	end
	show_board(board)
end

# Comptage des tours 
def turn_count(board)
	counter = 0
	board.each do |spaces|
		if spaces == "X" || spaces == "O"
			counter +=1
		end
	end
	counter
end

# A qui de jouer? 
def current_player(board)
	turn_count(board) % 2 == 0 ? "X" : "O"
end

#binding.pry

# Est-ce qu'il y a un vainqueur? 
def won?(board)
	WIN_COMBOS.detect do |win_combo| # win_combo est un array des 3 index qui composent une combo gagnante
		win_index_1 = win_combo[0]
		win_index_2 = win_combo[1]
		win_index_3 = win_combo[2]

		position_1 = board[win_index_1] # on récupère la position de chaque indique qui compose la combo gagnante
		position_2 = board[win_index_2] 
		position_3 = board[win_index_3] 

		position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1) #on s'assure qu'il y a bien un 'X' ou un 'O' sur la case (on ne veut pas un alignement de 3 cases vides)
	end
end

def full?(board) #est-ce que la grille est pleine ?
	board.all? {|i| i == "X" || i == "O"}
end

def draw?(board) #match nul 
	!won?(board) && full?(board)
end

def over?(board) #game over si match nul ou s'il y a un vainqueur ou si la grille est pleine 
	if draw?(board) || won?(board) || full?(board)
		return true
	end
end

def winner(board) #s'il y a un gagnant, le jeu return un 'X' ou un 'O'
	if won?(board)
		return board[won?(board)[0]]
	end
end

def play(board) #on joue tant que c'est pas over (duh)
	until over?(board) #jusqu'à ce que le jeu se termine
		turn(board) #les joueurs jouent à tour de rôle 
	end
	#on joue les premiers tours du jeu 
	if won?(board) #s'il y a un gagnant...
		winner(board) == "X" || winner(board) == "O" #on vérifie qui est le vainqueur
		puts "\n"
		puts "Félicitations #{winner(board)} !" #on le félicite
	elsif draw?(board) #en cas d'égalité
		puts "Match nul!"
	end
end






