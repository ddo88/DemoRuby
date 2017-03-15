class Project
	attr_accessor:Name
	attr_accessor:ValueProject
	attr_accessor:InitialPayment
	attr_accessor:ValueProjectWihtOutInitialPayment

	def initialize(name,valueProject,initialPayment)
		@Name  = name
		@ValueProject = valueProject
		@InitialPayment= initialPayment
		
		@ValueProjectWihtOutInitialPayment =@ValueProject-(@ValueProject*@InitialPayment)
	end
end
