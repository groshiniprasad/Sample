class Mars 
	def initialize(l,b)
	  @l = l
	  @b = b
	end 
	def grid 
	  Array.new(@l) { Array.new(@b,".") } 
	end
end 

class Foo
	@@my_mars
	@@robot_positions = {}
	def bar my_length=5, my_breadth=5  
	 @@my_mars = Mars.new(my_length,my_breadth).grid
	end 

	def show  my_robots = 3
		my_robots.times do 
			x = Random.new.rand(0..4)
			y = Random.new.rand(0..4) 
			@@my_mars[x][y] = Robot.new.name	
		end 
		@@my_mars
	end

	def find_positions 
		key = []
		value = []
		@@my_mars.each do |x| 
			key <<  @@my_mars.index(x)   if (  x.find_index { |e| e.match( /R/ )  } ) 
		end 

		key.each do |x|
			@@my_mars[x].each do |y|
				value << @@my_mars[x].index(y) if ( y == String.new("R"))
			end 
		end 
		key 
		value 
		@@robot_positions =  Hash[key.zip(value)]
	end 

	count = 0
	def res dest_length = 2,dest_breadth = 2
		@@robot_positions.each do |l,b|
			count+=1
			count
			m = l - dest_length
			n = b - dest_breadth
			if ( m < 0 && n < 0)
				right(m.abs, l, b)
				down(n.abs,l ,b + m.abs)
			elsif ( m < 0 && n > 0)
				right(m.abs, l, b)
				up(n.abs, l, (b + m.abs))
			elsif ( m < 0 && n == 0 )
				right(m.abs)
			elsif ( m > 0 && n < 0 )
				left(m.abs, l, b)
				down(n.abs, l, (b - m).abs)
			elsif ( m > 0 && n > 0 )
				left(m.abs, l, b) 
				up(n.abs,l , (b-m).abs)
			elsif (m > 0 && n == 0 )
				left(m.abs, l, b)
			elsif (m == 0 && n < 0)
				down(n.abs, l, b)
			elsif (m == 0 && n > 0)
				up(n.abs, l, b)
			else ( m == 0 && n == 0)
				p "True"
			end 
		end 
	end 


	private def right (m, x, y)
		@@my_mars[x][y+=m] = @@my_mars[x][y]
		@@my_mars[x][y] = ""
		@@my_mars[x][y+=m]
		p " Went Right"
	end 
	private def left (m, x, y)
		@@my_mars[x][y-=m] = @@my_mars[x][y]
		@@my_mars[x][y] = ""
		@@my_mars[x][y-=m]
		p " Went Left"
	end 
	private def up (n, x, y)
		@@my_mars[x-=n][y] = @@my_mars[x][y]
		@@my_mars[x][y] = ""
		@@my_mars[x-=n][y]
		p " Went Up"
	end 
	private def down (n, x, y)
		@@my_mars[x+=n][y] = @@my_mars[x][y]
		@@my_mars[x][y] = ""
		@@my_mars[x-=n][y]
		p " Went Down"
	end 

end 



	
class Robot 
	 attr_accessor :name 
	 def initialize 
	 	@name = String.new("R")
	end 
end 