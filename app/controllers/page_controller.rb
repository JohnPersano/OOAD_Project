

class PageController < ApplicationController
  before_action :employee_login_required, only: :employee_dashboard
  before_action :set_cache_buster, only: :employee_dashboard

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

  def employee_dashboard
    @customers = Customer.all
  end

  private

  def set_cache_buster
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end
