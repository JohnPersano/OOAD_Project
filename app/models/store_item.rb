class StoreItem

  attr_accessor :quantity, :available, :available_time, :cost, :address, :vehicle

  def initialize(data)
    # Simple data
    @quantity = data[:quantity]
    @available = data[:available]
    @available_time = data[:available_time]
    @cost = data[:cost]
    @discount = data[:discount]

    # Complex data
    @dropoff_locations = data[:dropoff_locations]
    @vehicle = data[:vehicle]
  end

end