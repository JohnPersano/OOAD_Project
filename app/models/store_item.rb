# StoreItem class with Vehicle association
class StoreItem < ApplicationRecord
  belongs_to :store, optional: true
  has_one :vehicle
end
