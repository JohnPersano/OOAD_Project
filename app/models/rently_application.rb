# RentlyApplication class that handles top level user functionality
class RentlyApplication

  # Composition relationship (for database use)
  has_many :store

  # Use singleton pattern
  include Singleton

  # Ruby method of defining private attributes and their getter methods
  attr_accessor :server_uptime, :connections_served, :stacktraces, :stores

  # Called when RentlyApplication is initialized
  def initialize
    @stores = Store.all
  end

  # Updates the store's SSL certificate (psuedocode)
  def update_ssl_certificate
    Rails.update_certificate()
  end

  # Force Rently to display a server maintenance message (psuedocode)
  def display_server_downtime_message
    Rails.application.display('Server maintenance. Rently will be back in a bit!')
  end

  # Sends an email out to each Rently admin
  def email_rently_admins(message)

    # For each employee
    Employee.all.each do |employee|

      # If the Employee is a Rently Administrator, email them
      ApplicationMailer.send(employee, message) if employee.instance_of?(Administrator)
    end
  end

  # Sends an email out to each Rently customer
  def email_rently_customers(message)

    # For each customer
    Customer.all.each do |customer|
      ApplicationMailer.send(customer, message)
    end
  end

  # Clear every stacktrace
  def clear_stacktraces
    RentlyApplication.stacktraces = nil
  end

  # Saves the stacktraces to a file
  def get_stacktraces_report

    # For each stacktrace, write to a file
    RentlyApplication.stacktraces.each do |stacktrace|
      File.new.write(stacktrace)
    end
  end

  # Search for stores using address or airport
  def search_for_store(query)

    @stores = Store.all

    # List to hold all store matches
    store_matches = []

    # for each store
    @stores.each do |store|

      if query[:uid] && !query[:uid].empty?
        return store if store.uid == query[:uid]
      end

      # If the user entered a zipcode
      if query[:zip] && !query[:zip].empty?
        if store.address.zip == query[:zip]
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
end
