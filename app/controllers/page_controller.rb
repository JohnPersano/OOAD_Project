

class PageController < ApplicationController
  def home; end

  def find_location
    @states = %W[#{''} AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MA MI MN MO MS
                 MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY]
    @stores = RentlyApplication.instance.search_for_store(params)
  end

  def store
    @selected_store = RentlyApplication.instance.search_for_store(params)
  end
end
