# StoreItem class with Vehicle association
class StoreItem < ApplicationRecord
  belongs_to :store
  has_one :vehicle
end
