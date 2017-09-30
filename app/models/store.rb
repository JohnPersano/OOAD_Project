class Store

  attr_accessor :name, :phone_number, :hours, :address, :image_url

  def initialize(uid, name, phone_number, hours, image_url, address)
    @uid = uid
    @name = name
    @phone_number = phone_number
    @hours = hours
    @image_url = image_url

    @address = address
  end

  def self.search(search)
    the_count = []
    the_count << search[:zipcode]
    the_count << search[:airport]
  end
end