# Truck class that inherits from the Vehicle class using the inheritance pattern
class Truck < Vehicle

  # Note: Fields are inherited from the Vehicle class (using inheritance pattern)

  # Creates getter function for variable
  attr_accessor :bedsize

  # Called when the class is being initialized
  def initialize(bedsize)
    @bedsize = bedsize
  end

end