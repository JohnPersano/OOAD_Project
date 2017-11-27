class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Name validations
  validates_presence_of :name
  validates_format_of :name, with: /\A^[A-Z][a-zA-Z ]*$\Z/

  # License validations
  validates_presence_of :license_id
  validates_uniqueness_of :license_id
  validates_length_of :license_id, is: 9
  validates_numericality_of :license_id

  # License validations
  validates_presence_of :dob
  validates :dob, :timeliness => {before: lambda {8.years.ago}, :type => :date ,
                                  before_message: 'must be at least 18 years old'}
end
