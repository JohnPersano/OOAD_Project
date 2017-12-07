# Billinginformation class holds information concerning a customer's billing transaction
class BillingInformation < ApplicationRecord

  # Aggregate relationship (for database use)
  belongs_to :order, optional: true
  belongs_to :report, optional: true

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171203221011_create_billing_information'

  # Charge order through third party service using SOA pattern (psuedocode)
  def charge
    return SOAPaypalTransact(self)
  end

end
