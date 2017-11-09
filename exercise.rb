class System

  def initialize
    @bodies = []
  end

  def add(celestial_body)
    @bodies << celestial_body
  end

  def total_mass
    sum = 0
    @bodies.each {|body| sum += body}
    return sum
  end

  def bodies
    @bodies
  end

  def bodies_type(type)
    type_list = []
    @bodies.each { |body|
    if body.class == type
    type_list << body
    end}
    return type_list
  end
end


class Body < System

  def initialize(name, mass, solar_system)
    @name = name
    @mass = "#{mass} kgs"
    solar_system.add(self)
  end

  def name
    @name
  end

end

class Planet < Body

  def initialize(name, mass, day_in_hours, year_in_days, solar_system)
    super(name, mass, solar_system)
    @day = "#{day_in_hours} earth hours"
    @year = "#{year_in_days} earth days"
    @day_in_hours = day_in_hours
  end

  def name
    super
  end

  def day_in_hours
    @day_in_hours
  end
end


class Star < Body

  def initialize(name, mass, type, solar_system)
    super(name, mass, solar_system)
    @type = type
  end

  def name
    super
  end

end


class Moon < Body

  def initialize(name, mass, month_in_earth_days, planet, solar_system)
    super(name, mass, solar_system)
    @month = "#{month_in_earth_days*24/planet.day_in_hours} #{planet.name} days"
    @planet = planet.name
  end

  def name
    super
  end

end

# system
oss = System.new

#Stars
sun = Star.new("Sol", 1.989*10**30, "G-Type", oss)

# Planets
mercury = Planet.new("Mercury", 3.301*10**23, 1407, 88, oss)
venus = Planet.new("Venus", 4.868*10**24, 2802, 225, oss)
earth = Planet.new("Earth", 5.972*10**24, 24, 365, oss)
mars = Planet.new("Mars", 6.39*10**23, 24.5, 687, oss)
jupiter = Planet.new("Jupiter", 1.898*10**27, 10, 4300, oss)
saturn = Planet.new("Saturn", 5.683*10**26, 11, 11000, oss)
uranus = Planet.new("Uranus", 8.681*10**25, 18, 31000, oss)
neptune = Planet.new("Neptune", 1.024*10**26, 16, 60200, oss)
pluto = Planet.new("Pluto", 1.309*10**22, 153, 90500, oss)

# Moons
moon = Moon.new("Luna", 7.348*10**22, 27, earth, oss)
europa = Moon.new("Europa", 4.799*10**22, 3.55, jupiter, oss)
ganymede = Moon.new("Ganymede", 1.48*10**23, 7.154, jupiter, oss)
triton = Moon.new("Triton", 2.14*10**22, -5.877, neptune, oss)
io = Moon.new("Io", 8.94*10**22, 1.769, jupiter, oss)
umbriel = Moon.new("Umbriel", 1.27*10**21, 4.144, uranus, oss)
enceladus = Moon.new("Enceladus", 8.40*10**19, 1.37, saturn, oss)
titan = Moon.new("Titan", 1.35*10**23, 15.95, saturn, oss)
