# Address class with Store, Employee, and Customer associations
class Address < ApplicationRecord
  belongs_to :store
  belongs_to :employee
  belongs_to :customer
end
