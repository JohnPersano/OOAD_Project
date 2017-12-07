# Address class with Store, Employee, and Customer associations
class Address < ApplicationRecord

  # Composition relationship (for database use)
  belongs_to :store, optional: true
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true

  # Edit a particular Address in the database
  def edit_address(edited_address)
    address = Address.find(edited_address.uid)
    address.attributes = edited_address.attributes
    address.save!
  end

  # Delete a particular Address from the database
  def delete_address(address)
    address.delete!
  end

  # All functions below are private
  private

  # Cleanse Address through third party service using SOA pattern (psuedocode)
  def cleanse_address(address)
    cleansed_address = SOAAddressCleanser.cleanse_address(address)
    cleansed_address.save!
  end

  # Validate zipcode through third party service using SOA pattern (psuedocode)
  def validate_zip(address)
    return SOAZipValidator(address.city, address.zipcode)
  end

end
