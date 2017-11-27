# Vehicle description with Vehicle class association
class VehicleDescription < ApplicationRecord
  belongs_to :vehicle
end
