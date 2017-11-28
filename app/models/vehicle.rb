# Vehicle class with StoreItem and VehicleDescription associations
class Vehicle < ApplicationRecord
  belongs_to :store_item, optional: true
  has_one :vehicle_description
end
