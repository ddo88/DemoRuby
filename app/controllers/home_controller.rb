class HomeController < ApplicationController
	
	attr_accessor:User
	attr_accessor:Tasa
	attr_accessor:PlazoMeses
	attr_accessor:Project
	attr_accessor:Cuotas

  	def initialize
		@Tasa=0.89
		@PlazoMeses=60
		projects = Array.[](Project.new("Proyecto 1",160000000,0.3),Project.new("Proyecto2",200000000,0.3),Project.new("Proyecto3",130000000,0.3))
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
		totalPrestamo = @Project.ValueProjectWihtOutInitialPayment;
	  	tasaMensual=((@Tasa/12)/100)
	  	valorCuota= (tasaMensual*totalPrestamo)/(1-((1+tasaMensual)**(-@PlazoMeses)))
	  	@PlazoMeses.times do |plazo|
			@Cuotas.push(Cuota.new(valorCuota,plazo+1))
	  	end
	end  
end