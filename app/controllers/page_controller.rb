

class PageController < ApplicationController
  def home
  end

  def find_location
    application = RentlyApplication.new
    @stores = application.search(params)
  end
end
