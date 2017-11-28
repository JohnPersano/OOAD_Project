class Order < ApplicationRecord
  belongs_to :customer, optional: true
end
