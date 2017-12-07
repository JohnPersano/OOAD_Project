# Vehicle class which holds unique vehicle information
class Vehicle < ApplicationRecord

  # Aggregate and Association relationships (for database use)
  belongs_to :store_item, optional: true
  has_one :vehicle_description

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171127184159_create_vehicles'

  # Add a Vehicle to the database
  def add_vehicle(vin, plate, mileage, status, images)
    vehicle = Vehicle.new(vin: vin, plate: plate, mileage: mileage,
                          staus: status, image_url: images)
    vehicle.save!
  end

  # Edit a Vehicle
  def edit_vehicle(edit_vehicle)
    vehicle = Vehicle.all.where(vin: edit_vehicle.vin)
    vehicle.attributes = edit_vehicle.attributes
    vehicle.save!
  end

  # Delete a vehicle from the database
  def remove_vehicle(vehicle)
    vehicle = Vehicle.find(vehicle)
    vehicle.delete!
  end

end
