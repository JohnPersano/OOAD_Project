# Address class with Store, Employee, and Customer associations
class Address < ApplicationRecord
  belongs_to :store, optional: true
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true
end
