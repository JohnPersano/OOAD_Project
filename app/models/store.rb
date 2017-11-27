class Store < ApplicationRecord
  has_one :address
  has_many :store_items
end
