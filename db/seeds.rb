
# Seed Employee administrator data
Employee.create!(name: 'John Persano', email: 'john@rently.com', password: 'qweqwe', password_confirmation: 'qweqwe',
                 employee_id: 'MST-REN12345', dob: Date.parse('1991-02-03'))

Customer.create!(name: 'Joe Schmoe', email: 'joe@schmoe.com', password: 'qweqwe', password_confirmation: 'qweqwe',
                 license_id: 123456789, dob: Date.parse('1991-02-03'))

# Camaro database information
camaro_vehicle = Vehicle.create!(vin: 'QWERTY1234567', plate: 'CU-L8R', mileage: 120_000, image_url: 'camaro_1.jpg')
camaro_vehicle.vehicle_description = VehicleDescription.create!(model: 'Camaro', make: 'Chevy', year: 1995,
                                                                color: 'Red', description: 'Fast, fun, and loud!',
                                                                seats: 4, doors: 2)

camaro_store_item = StoreItem.create!(quantity: 3, available: true, available_time: '12-08-2017',
                                    cost: 87.00, discount: 0, dropoff_location: 'Mystic')
camaro_store_item.vehicle = camaro_vehicle


# Corvette database information
corvette_vehicle = Vehicle.create!(vin: 'AASDFG123456', plate: 'MID-CYS', mileage: 5_000, image_url: 'corvette_1.jpg')
corvette_vehicle.vehicle_description = VehicleDescription.create!(model: 'Corvette', make: 'Chevy', year: 2018,
                                                                  color: 'Black', description: 'Extremly fast sports car!',
                                                                  seats: 2, doors: 2)


corvette_store_item = StoreItem.create!(quantity: 5, available: true, available_time: '12-26-2017',
                                  cost: 126.00, discount: 0, dropoff_location: 'Milford')
corvette_store_item.vehicle = corvette_vehicle

# Mystic store information
mystic_address = Address.create!(street_name: 'Seaport Ave.', street_number: '101', apartment: '',
                                 city: 'Mystic', state: 'CT', country: 'USA', zip: '06355')

mystic_store = Store.create!(uid: '123', name: 'Mystic Rently', phone_number: '(860) 345-6790',
                             image_url: 'store_1.jpg', hours: 'M-F:9-5')
mystic_store.store_item << camaro_store_item
mystic_store.address = mystic_address

# Milford store information
milford_address = Address.create!(street_name: 'Post Rd.', street_number: '76', apartment: '',
                                  city: 'Milford', state: 'CT', country: 'USA', zip: '06514')
milford_store = Store.create!(uid: '312', name: 'Milford Rently', phone_number: '(203) 678-2234',
                             image_url: 'store_2.jpg', hours: 'M-F:8-4')
milford_store.store_item << corvette_store_item
milford_store.address = milford_address
