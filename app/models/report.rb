# Report class used for generating reports about a group of orders
class Report < ApplicationRecord

  # Aggregate relationship (for database use)
  has_many :order

  def generate(params)

    # Create a new report file
    file = File.new('Report.csv')

    # Grab all orders by a set of parameters
    orders = Order.all.where(params)

    # Write each report line to a file
    orders.each do |order|
      file.write(order.id + ',' + order.total.to_s + ',' + order.state + ',' + order.date.to_s + ',')
    end

    # Save the file
    file.save!
  end

end
