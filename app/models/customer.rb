# Customer class which holds information about a particular customer
class Customer < ApplicationRecord

  # Aggregate and Association relationships (for database use)
  has_one :address
  has_many :order

  # Devise Authentication specific attributes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171010145316_devise_create_customers'
  #       Instead of using public functions to validate data, we will use Rails database validations

  # Public fields (generates getter functions)
  attr_accessor :name, :email, :phone_number

  # Name validations
  validates_presence_of :name
  validates_format_of :name, with: /\A^[A-Z][a-zA-Z ]*$\Z/

  # License validations
  validates_presence_of :license_id
  validates_uniqueness_of :license_id
  validates_length_of :license_id, is: 9
  validates_numericality_of :license_id

  # DOB validations
  validates_presence_of :dob
  validates :dob, :timeliness => {before: lambda {8.years.ago}, :type => :date,
                                  before_message: 'must be at least 18 years old'}
end
