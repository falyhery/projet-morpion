require 'bundler'
Bundler.require

class Show # affiche le tableau de jeu 

	def show_board
		puts row = ["   " "|" "   " "|" "   "]
   	puts line = "-" * 11
   	puts row
   	puts line
   	puts row
	end



	# render
	# def render
	# 	puts 
	# 		# loop through data structure 
	# 		@board.each do |row|
	# 			row.each do |boardcase|
	# 				# display an existing marker if any, else blank 
	# 				boardcase.nil? ? print("-") : print(boardcase.to_s)
	# 			end
	# 			puts
	# 		end
	# 		puts
	# end

	# show the board 

end

