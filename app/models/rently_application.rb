
# Handles generating faux data
include RentlyApplicationHelper

# Class that handles top level user functionality
class RentlyApplication
  # Ruby mixin that forces RentlyApplication to be a singleton
  include Singleton

  attr_accessor :stores

  # Called when RentlyApplication is initialized
  def initialize
    @stores = load_stores
  end

  # Search for stores using address or airport
  def search_for_store(query)

    # List to hold all store matches
    store_matches = []

    # for each store
    @stores.each do |store|

      if query[:uid] && !query[:uid].empty?
        return store if store.uid == query[:uid]
      end

      # If the user entered a zipcode
      if query[:zipcode] && !query[:zipcode].empty?
        if store.address.zipcode == query[:zipcode]
          store_matches << store
          next
        end
        next
      end

      next unless store.address.state == query[:state]

      # If the user entered a street name
      if query[:street_name] && !query[:street_name].empty?

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
      if query[:city] && !query[:city].empty?

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

  # Load store data
  def load_stores

    # DataGenerator generatees faux data, in production this would be a database
    DataGenerator.instance.get_store_data
  end
end
