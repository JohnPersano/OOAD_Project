# StoreItem class that holds store information about a particular Vehicle
class StoreItem < ApplicationRecord

  # Association relationship (for database use)
  belongs_to :store, optional: true
  belongs_to :order, optional: true
  has_one :vehicle

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171127184903_create_store_items'

end
