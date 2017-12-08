# Employee class which holds information about a particular employee
class Employee < ApplicationRecord

  # Composition relationship (for database use)
  has_one :address

  # Devise Authentication specific attributes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171010165151_devise_create_employees'
  #       Instead of using public functions to validate data, we will use Rails database validations

  # Public fields (generates getter functions)
  attr_accessor :employee_id, :employee_email, :phone_number

  # Name validations
  validates_presence_of :name
  validates_format_of :name, with: /\A^[A-Z][a-zA-Z ]*$\Z/

  # ID validations
  validates_presence_of :employee_id
  validates_uniqueness_of :employee_id
  validates_length_of :employee_id, is: 12

  # DOB validations
  validates_presence_of :dob
  validates :dob, :timeliness => {before: lambda {18.years.ago}, :type => :date ,
                                  before_message: 'must be at least 18 years old'}
end
