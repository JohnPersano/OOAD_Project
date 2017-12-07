# Vehicle description which holds non-unique vehicle data
class VehicleDescription < ApplicationRecord

  # Association relationship (for database use)
  belongs_to :vehicle, optional: true

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171127183527_create_vehicle_descriptions'

end
