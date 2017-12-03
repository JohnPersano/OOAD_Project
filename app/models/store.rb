# Store class that has many users/employees and store items
class Store < ApplicationRecord

  # Composition relationships (for database use)
  belongs_to :rently_application, optional: true
  has_one :address
  has_many :store_item

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171127185422_create_stores'

  # Gets the street location in a human readable format
  def get_street_location
    address = self.address
    return address.street_number + address.street_name + address.city + address.state + address.zip
  end

  # Gets the street location in a human readable format
  def edit_info(uid, phone_number, address)
    self.uid = uid
    self.phone_number = phone_number
    self.address = address
    self.save!
  end

  # Edit the hours of a particular location
  def edit_hours(hours)
    self.hours = nil

    # The hours parameter is a list of strings
    hours.each do |hour|

      # Each string is tokenized by a ':' separator
      day = hour.split(':')[0]
      times = hour.split(':')[1]

      # Add the concatenated time to the hours string
      self.hours += 'Day: ' + day + 'Times: ' + times
    end
  end

  # Returns true if a particular location is open now
  def open_now?

    now = DateTime.now
    reg_match = /Day: #{now.day} Times: [0-24][0-60]/.match(self.hours)

    if reg_match == nil
      return false
    end

    open_hour = reg_match.split(' ')[0].to_i
    close_hour = reg_match.split(' ')[1].to_i

    if (open_hour < now.hour < close_hour) then
      return true
    else
      return false
    end
  end

  # Functions below here are private
  private

  # Uses SOA architecture (psuedocode)
  def convert_gps_to_location
    return GPSSOAService.get_gps_location_as_address
  end

end
