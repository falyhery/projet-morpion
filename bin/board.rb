class Board # Maintains game board state
	attr_accessor :board, :count_turn, :boardcase # compter le nombre de coups joués 

	# initialize board 
	def initialize
		# set up blank data structure
		@board = Array.new(3){Array.new(3)}
		# @board[0][0] = boardcase1

		# @boardcase2 = BoardCase.new("A2", "")
		# @board[0][1] = @boardcase2
		
		# @boardcase3 = BoardCase.new("A3", "")
		# @board[0][2] = @boardcase3
		
		# @boardcase4 = BoardCase.new("B1", "")
		# @board[1][0] = @boardcase4
		
		# @boardcase5 = BoardCase.new("B2", "")
		# @board[1][1] = @boardcase5
		
		# @boardcase6 = BoardCase.new("B3", "")
		# @board[1][2] = @boardcase6
		
		# @boardcase7 = BoardCase.new("C1", "")
		# @board[2][0] = @boardcase7
		
		# @boardcase8 = BoardCase.new("C2", "")
		# @board[2][1] = @boardcase8
		
		# @boardcase9 = BoardCase.new("C3", "")
		# @board[2][2] = @boardcase9
	end



end