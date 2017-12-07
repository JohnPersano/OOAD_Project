# Order class that holds information about a customer's order
class Order < ApplicationRecord

  # Composition relationships (for database use)
  belongs_to :customer, optional: true
  has_many :store_item
  has_one :billing_information

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171128163903_create_orders'

  # Cancel the transaction
  def cancel
    self.status = 'Cancelled'
    self.save!
  end

  # Edit the transaction
  def approve
    self.status = 'Approved'
    self.save!
  end

end
