class Cuota 
	attr_accessor:Mes
	attr_accessor:Share
	attr_accessor:Number
	def initialize(share,number)
		@Share=share,
		@Number=number,
		@Mes = Date.today + number.months
	end
end