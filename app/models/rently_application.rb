
# Class that handles top level user functionality
class RentlyApplication
  # Ruby mixin that forces RentlyApplication to be a singleton
  include Singleton

  # Called when RentlyApplication is initialized
  def initialize
    @stores = generate_stores
  end

  # Search for stores using address or airport
  def search_for_store(query)
    # List to hold all store matches
    store_matches = []

    @stores.each do |store|
      if store.address.zipcode == query[:zipcode]
        store_matches << store
        next
      end

      next unless store.address.state == query[:state]

      # If the user entered a street name
      if query[:street_name]

        # Downcase and remove all spaces in both the query and store street names
        sanitized_store_street_name = store.address.street_name.downcase.gsub(/\s+/, '')
        sanitized_query_street_name = query[:street_name].downcase.gsub(/\s+/, '')

        # Add store to results if the store street name matches the query street name
        if sanitized_store_street_name == sanitized_query_street_name
          store_matches << store
          next
        end
      end

      # If the user entered a city name
      if query[:city]

        # Downcase and remove all spaces in both the query and store city
        sanitized_store_city = store.address.city.downcase.gsub(/\s+/, '')
        sanitized_query_city = query[:city].downcase.gsub(/\s+/, '')

        # Add store to results if the store city matches the query city
        if sanitized_store_city == sanitized_query_city
          store_matches << store
          next
        end
      end

      # Is the user only entered a state name, show all stores in the state
      unless (query[:street_name] && !query[:street_name].empty?) || (query[:city] && !query[:city].empty?)
        store_matches << store
      end
    end
    store_matches
  end

  def generate_stores
    typical_hours = { monday:    [700, 1700],
                      tuesday:   [700, 1700],
                      wednesday: [700, 1700],
                      thursday:  [700, 1700],
                      friday:    [700, 1400] }

    mystic_address = Address.new('Main St.', 123, '', 'Mystic', 'CT', 'USA', '06355')
    mystic_store = Store.new('1234', 'Mystic Rently', 1_234_567_890, typical_hours,
                             'store_1.jpg', mystic_address)

    milford_address = Address.new('Post rd.', 101, '', 'Milford', 'CT', 'USA', '06514')
    milford_store = Store.new('1234', 'Milford Rently', 1_234_567_890, typical_hours,
                              'store_2.jpg', milford_address)

    [mystic_store, milford_store]
  end
end
