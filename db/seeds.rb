
# Seed Employee administrator data
Employee.create!(name: 'John Persano', email: 'john@rently.com', password: 'qweqwe', password_confirmation: 'qweqwe',
                 employee_id: 'MST-REN12345', dob: Date.parse('1991-02-03'))

# Store addresses
mystic_address = Address.create!(street_name: 'Seaport Ave.', street_number: '101', apartment: '',
                                 city: 'Mystic', state: 'CT', country: 'USA', zip: '06355')

milford_address = Address.create!(street_name: 'Post Rd.', street_number: '76', apartment: '',
                                  city: 'Milford', state: 'CT', country: 'USA', zip: '06514')

# Camaro database information
camaro_vehicle = Vehicle.create!(vin: 'QWERTY1234567', plate: 'CU-L8R', mileage: 120_000, image_url: 'camaro_1.jpg')
camaro_vehicle.vehicle_description = VehicleDescription.create!(model: 'Camaro', make: 'Chevy', year: 1995,
                                                                color: 'Red', description: 'Fast, fun, and loud!',
                                                                seats: 4, doors: 2)

camaro_store_item = StoreItem.new(quantity: 1, available: true, available_time: '12-08-2017',
                                    cost: 87.00, discount: 0, dropoff_location: 'Mystic')
camaro_store_item.vehicle = camaro_vehicle


# Corvette database information
corvette_vehicle = Vehicle.new(vin: 'AASDFG123456', plate: 'MID-CYS', mileage: 5_000, image_url: 'corvette_1.jpg')
corvette_vehicle.vehicle_description = VehicleDescription.create!(model: 'Corvette', make: 'Chevy', year: 2018,
                                                                  color: 'Black', description: 'Extremly fast sports car!',
                                                                  seats: 2, doors: 2)
corvette_store_item = StoreItem.new(quantity: 2, available: true, available_time: '12-26-2017',
                                  cost: 126.00, discount: 0, dropoff_location: 'Milford')
corvette_store_item.vehicle = corvette_vehicle