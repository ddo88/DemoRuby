class HomeController < ApplicationController
	
	attr_accessor:User
	attr_accessor:Tasa
	attr_accessor:PlazoMeses
	attr_accessor:Project
	attr_accessor:Cuotas

  def initialize
	@Tasa=0.3
	@PlazoMeses=30
	projects = Array.[](Project.new("Proyecto 1",2000,0.3),Project.new("Proyecto2",4000,0.3),Project.new("Proyecto3",5000,0.3))
  	@User = Persona.new("Daniel",100000,projects)
	@Project = projects[0];
	@Cuotas=[]
  end
  def index
	getCuotas(@Project.Name)
  end

	def update
		@Tasa=params[:tasa].to_f
		@PlazoMeses=params[:plazo].to_i
	  	getCuotas(params[:project])
  	end
	  
	def getCuotas(projectName)
		@Project = @User.Favorites.detect{ |p| p.Name == projectName }
	  	tasaMensual=((1+@Tasa)**12)-1
	  	valorCuota= (@Project.ValueProject * tasaMensual)/@PlazoMeses
		
	  	@PlazoMeses.times do |plazo|
			@Cuotas.push(Cuota.new(valorCuota,plazo+1))
	  	end
	end  
end

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
	attr_accessor:ValueProject
	attr_accessor:InitialPayment

	def initialize(name,valueProject,initialPayment)
		@Name  = name
		@ValueProject = valueProject
		@InitialPayment= initialPayment
	end
end
