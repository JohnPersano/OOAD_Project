class Vehicle

  attr_accessor :vin, :plate, :mileage, :status, :discount, :image_urls, :vehicle_description

  def initialize(data)
    # Simple data
    @vin = data[:vin]
    @plate = data[:plate]
    @mileage = data[:mileage]
    @status = data[:status]

    # Complex data
    @image_urls = data[:image_urls]
    @vehicle_description = data[:vehicle_description]
  end

end