class BoardCase # Maintains game boardcases state 
	attr_accessor :case_value, :case_id 

	def initialize(case_id_to_update, case_value_to_update)
		@case_id = case_id_to_update 
		@case_value = case_value_to_update
		@boardcase = Hash.new
		@boardcase[case_id] = case_value
	end

end