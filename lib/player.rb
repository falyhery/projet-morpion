class Player
	attr_reader :name, :value 

	def initialize(name_to_update, value_to_update)
		@name = name_to_update
		@value = value_to_update # X ou O 
	end

end