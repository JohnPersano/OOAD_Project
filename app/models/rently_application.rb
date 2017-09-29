class RentlyApplication
  def initialize
    @stores = generate_stores
  end

  def search(search)
    result = []

    unless @stores
      return
    end

    @stores.each do |store|
      puts store
      if store.address.zipcode == search[:zipcode]
        result << store
      end
    end
    result
  end

  def generate_stores
    typical_hours = { monday:    [700, 1700],
                      tuesday:   [700, 1700],
                      wednesday: [700, 1700],
                      thursday:  [700, 1700],
                      friday:    [700, 1400] }

    mystic_address = Address.new('Main St.', 123, '', 'Mystic', 'Connecticut', 'USA', '06355')
    mystic_store = Store.new('1234', 'Mystic Rently', 1_234_567_890, typical_hours, mystic_address)

    milford_address = Address.new('Post rd.', 101, '', 'Milford', 'Connecticut', 'USA', '06514')
    milford_store = Store.new('1234', 'Milford Rently', 1_234_567_890, typical_hours, milford_address)

    [mystic_store, milford_store]
  end
end
