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


end


class Body < System

  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end

class Planet < Body

  def initialize(name, mass, day_in_hours, year_in_days)
    super
    @day = day_in_hours
    @year = year_in_days
  end

end


class Star < Body

  def initialize(name, mass, type)
    super
    @type = type
  end

end


class Moon < Body

  def initialize(name, mass, month, planet)
    super
    @month = month
    @planet = planet
  end

end
