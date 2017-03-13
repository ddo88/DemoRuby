class HomeController < ApplicationController
	
	attr_accessor:User
  def index
  	projects = Array.[](Project.new("Proyecto 1",2000,0.3),Project.new("Proyecto2",4000,0.3),Project.new("Proyecto3",5000,0.3))
  	@User = Persona.new("Daniel",100000,projects)
  end
end


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

class Project
	attr_accessor:Name
	attr_accessor:Value
	attr_accessor:InitialPayment

	def initialize(name,value,initialPayment)
		@Name  = name
		@Value = value
		@InitialPayment= initialPayment
	end
end
