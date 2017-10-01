class VehicleDescription

  attr_accessor :model, :make, :year, :color, :description, :seats, :doors

  def initialize(data)
    # Simple data
    @model = data[:model]
    @make = data[:make]
    @year = data[:year]
    @color = data[:color]
    @description = data[:description]
    @seats = data[:seats]
    @doors = data[:doors]
  end

end