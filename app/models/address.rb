class Address

  attr_accessor :street_name, :street_number, :apartment,
                :city, :state, :country, :zipcode

  def initialize(street_name, street_number, apartment, city, state, country, zipcode)
    @street_name = street_name
    @street_number = street_number
    @apartment = apartment
    @city = city
    @state = state
    @country = country
    @zipcode = zipcode
  end


end