# StoreItem class with Vehicle association
class StoreItem < ApplicationRecord
  has_one :vehicle
end
