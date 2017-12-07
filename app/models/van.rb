# Van class that inherits from the Vehicle class using the inheritance pattern
class Van < Vehicle

  # Note: Fields are inherited from the Vehicle class (using inheritance pattern)

  # Creates getter function for variable
  attr_accessor :capacity_ft

  # Called when the class is being initialized
  def initialize(capacity_ft)
    @capacity_ft = capacity_ft
  end

end