class Store

  attr_accessor :address, :name


  def initialize(uid, name, phone_number, hours, address)
    @uid = uid
    @name = name
    @phone_number = phone_number
    @hours = hours

    @address = address
  end

  def self.search(search)
    the_count = []
    the_count << search[:zipcode]
    the_count << search[:airport]
  end
end