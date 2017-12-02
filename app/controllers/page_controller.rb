

class PageController < ApplicationController
  before_action :employee_login_required, only: [:employee_dashboard, :order_action]
  before_action :set_cache_buster, only: [:employee_dashboard, :order_action, :order_submitted, :order]
  before_action :customer_account_required, only: [:order, :order_submitted]

  attr_accessor :stores

  def home
    # Empty controller function
  end

  def find_location
    @states = %w[ AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MA MI MN MO MS
                  MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY]
    @stores = RentlyApplication.instance.search_for_store(params)
  end

  def store
    @selected_store = RentlyApplication.instance.search_for_store(params)
  end
  
  def order
    @order_store_item = StoreItem.find(params[:store_item])
    @order_store = @order_store_item.store
  end

  def order_submitted
    store = Store.find(params[:store])
    store_item = StoreItem.find(params[:store_item])
    @order = Order.create!(store_uid: store.uid, vehicle_vin: store_item.vehicle.vin, date: Date.today,
                           status: 'Pending', total: store_item.cost)
    @order.customer = current_customer
    @order.save!
  end

  def order_action
    @order = Order.find(params[:order])
    @action = params[:order_action]

    if params[:order_action] == 'approved'
      @order.status = 'Approved'
      store_item = Vehicle.find_by_vin(@order.vehicle_vin).store_item
      store_item.quantity -= 1
      store_item.save!
    elsif params[:order_action] == 'rejected'
      @order.status = 'Rejected'
    end
    @order.save
    puts @order.status
  end

  def employee_dashboard
    @customers = Customer.all
    @orders = Order.where(status: 'Pending')
  end

  private

  def set_cache_buster
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end
