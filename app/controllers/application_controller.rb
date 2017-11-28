class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def employee_login_required
    redirect_to '/', alert: 'You are not authorized to view that page' if current_employee.blank?
  end

  def customer_login_required
    redirect_to '/', alert: 'You are not authorized to view that page' if current_customer.blank?
  end

  def customer_account_required
    #redirect_to new_customer_session_path, alert: 'Please login before placing an order!' if current_customer.blank?
  end
end
