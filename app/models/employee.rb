class Employee < ApplicationRecord

  has_one :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
