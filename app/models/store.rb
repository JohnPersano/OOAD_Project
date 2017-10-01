class Store

  attr_accessor :uid, :name, :phone_number, :image_url, :hours, :address, :store_items

  def initialize(data)

    puts data
    @uid = data[:uid]
    @name = data[:name]
    @phone_number = data[:phone_number]
    @image_url = data[:image_url]

    @hours = data[:hours]
    @address = data[:address]
    @customers = data[:customers]
    @employees = data[:employees]
    @administrator = data[:administrator]
    @store_items = data[:store_items]
  end

  def self.search(search)
    the_count = []
    the_count << search[:zipcode]
    the_count << search[:airport]
  end
end