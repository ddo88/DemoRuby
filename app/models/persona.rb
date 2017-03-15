class Persona
	
	attr_accessor:Name
	attr_accessor:Budget
	attr_accessor:Favorites
	def initialize(name,budget,favorites)
		@Name=name
		@Budget=budget
		@Favorites=favorites
	end
end