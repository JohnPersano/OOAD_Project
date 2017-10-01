module RentlyApplicationHelper
  class DataGenerator
    include Singleton

    def get_store_data
      # Generic data
      typical_hours = { monday:    [700, 1700],
                        tuesday:   [700, 1700],
                        wednesday: [700, 1700],
                        thursday:  [700, 1700],
                        friday:    [700, 1400] }

      # Mystic address data
      mystic_uid = '1000'
      mystic_name = 'Mystic Rently'
      mystic_phone_number = '8601113344'
      mystic_image_url = 'store_1.jpg'
      mystic_hours = typical_hours
      mystic_address = Address.new('Seaport ave.', 101, '', 'Mystic', 'CT', 'USA', '06355')
      mystic_customers = nil
      mystic_employees = nil
      mystic_administrator = nil
      mystic_store_items = get_mystic_store_items
      mystic_store = Store.new(uid: mystic_uid,
                               name: mystic_name,
                               phone_number: mystic_phone_number,
                               image_url: mystic_image_url,
                               hours: mystic_hours,
                               address: mystic_address,
                               customers: mystic_customers,
                               employees: mystic_employees,
                               administrator: mystic_administrator,
                               store_items: mystic_store_items)

      # Milford address data
      milford_uid = '1001'
      milford_name = 'Milford Rently'
      milford_phone_number = '2032225566'
      milford_image_url = 'store_2.jpg'
      milford_hours = typical_hours
      milford_address = Address.new('Post rd.', 500, '', 'Milford', 'CT', 'USA', '06514')
      milford_customers = nil
      milford_employees = nil
      milford_administrator = nil
      milford_store_items = []
      milford_store = Store.new(uid: milford_uid,
                                name: milford_name,
                                phone_number: milford_phone_number,
                                image_url: milford_image_url,
                                hours: milford_hours,
                                address: milford_address,
                                customers: milford_customers,
                                employees: milford_employees,
                                administrator: milford_administrator,
                                store_items: milford_store_items)

      [mystic_store, milford_store]
    end

    def get_mystic_store_items
      # Old Camaro store item
      camaro_description = VehicleDescription.new(model: 'Camaro',
                                                  make: 'Chevy',
                                                  year: 1995,
                                                  color: 'Red',
                                                  description: 'Fast, fun, and loud!',
                                                  seats: 4,
                                                  doors: 2)
      camaro_vehicle = Vehicle.new(vin: 'QWERTY1234567',
                                   plate: 'CU-L8R',
                                   mileage: 120_000,
                                   status: 'Fine',
                                   image_urls: ['camaro_1.jpg', 'camaro_2.jpg'],
                                   vehicle_description: camaro_description)
      camaro_store_item = StoreItem.new(quantity: 2,
                                        available: true,
                                        available_time: '12-08-2017',
                                        cost: 34.00,
                                        discount: 0,
                                        dropoff_locations: ['1000'],
                                        vehicle: camaro_vehicle)

      # New Corvette
      corvette_description = VehicleDescription.new(model: 'Corvette',
                                                    make: 'Chevy',
                                                    year: 2018,
                                                    color: 'Black',
                                                    description: 'Extremly fast sports car!',
                                                    seats: 2,
                                                    doors: 2)
      corvette_vehicle = Vehicle.new(vin: 'AASDFG123456',
                                     plate: 'MID-CYS',
                                     mileage: 5_000,
                                     status: 'Fine',
                                     image_urls: ['corvette_1.jpg', 'corvette_2.jpg'],
                                     vehicle_description: corvette_description)
      corvette_store_item = StoreItem.new(quantity: 1,
                                          available: true,
                                          available_time: '12-08-2017',
                                          cost: 87.00,
                                          discount: 0,
                                          dropoff_locations: ['1000'],
                                          vehicle: corvette_vehicle)
      [camaro_store_item, corvette_store_item]
    end
  end
end
