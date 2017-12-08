require 'rails_helper'

describe 'Order page navigation behavior' do

  def navigate_to_mystic_store

    # Load the database seed if no data exists
    Rails.application.load_seed if Store.count <= 0

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in 'Mystic' as the city
    select('CT', from: 'state')
    fill_in 'city', with: 'Mystic'

    # Submit the search
    find_button('submit').click

    # Page should contain Mystic Rently
    expect(page).to have_content('Mystic Rently')

    click_on('Check inventory')

    # Page should contain Mystic Rently and a seed item
    expect(page).to have_content('Mystic Rently')
    expect(page).to have_content('1995 Chevy Camaro')
  end

  def login_user

    # Load the database seed if no data exists
    Rails.application.load_seed if Store.count <= 0

    visit customer_session_path

    fill_in 'customer_email',    with: 'joe@schmoe.com'
    fill_in 'customer_password', with: 'qweqwe'

    # Submit the login
    find_button('Log in').click

    # Successful login returns to root page
    expect(current_path).to eq root_path

    # Ensure message appears
    expect(page).to have_content('Signed in successfully.')
  end

  def login_employee

    # Load the database seed if no data exists
    Rails.application.load_seed if Store.count <= 0

    visit employee_session_path

    fill_in 'employee_email',    with: 'john@rently.com'
    fill_in 'employee_password', with: 'qweqwe'

    # Submit the login
    find_button('Log in').click

    # Successful login returns to root page
    expect(current_path).to eq root_path

    # Ensure message appears
    expect(page).to have_content('Signed in successfully.')
  end

  it 'should navigate to "Login page" if not logged in' do

    # Do not login, go to the store page
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should return customer to login page
    expect(current_path).to eq customer_session_path

    # Ensure error message appears
    expect(page).to have_content('Please login before placing an order!')
  end

  it 'should allow the customer to go to the order page if logged in' do

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')
  end

  it 'should allow the customer to place an order if logged in' do

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')

    # Send the order to the store
    click_on('Send order')

    # Customer should be brought to the order page
    expect(page).to have_content('Thanks for your order!')

  end

  it 'should add an order to the customer' do

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')

    # Send the order to the store
    click_on('Send order')

    # Customer should be brought to the order page
    expect(page).to have_content('Thanks for your order!')

    # Customer should have one order
    expect(Customer.first.order.count).to eq(1)
  end

  it 'should ensure status of unaccepted orders is "Pending"' do

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')

    # Send the order to the store
    click_on('Send order')

    # Customer should be brought to the order page
    expect(page).to have_content('Thanks for your order!')

    # Customer's order should be pending
    expect(Customer.first.order.first.status).to eq('Pending')
  end

  it 'should place orders in the employees queue' do

    # Load the database seed if no data exists
    Rails.application.load_seed if Store.count <= 0

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')

    # Send the order to the store
    click_on('Send order')

    # Customer should be brought to the order page
    expect(page).to have_content('Thanks for your order!')

    # Log out as the customer
    click_on('Log out')

    # Ensure the logout message appears
    expect(page).to have_content('Signed out successfully.')

    # Login as an employee
    login_employee

    # Go to the employee dashboard
    visit employee_dashboard_page_path

    # Ensure pending orders appears
    expect(page).to have_content('Pending orders')

    # Ensure an order appears from Joe Schmoe
    expect(page).to have_content('Joe Schmoe')

  end

  it 'should automatically adjust inventory for accepted orders' do

    # Load the database seed if no data exists
    Rails.application.load_seed if Store.count <= 0

    on_hand = StoreItem.all.where(cost: 87.00).first.quantity

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')

    # Send the order to the store
    click_on('Send order')

    # Customer should be brought to the order page
    expect(page).to have_content('Thanks for your order!')

    # Log out as the customer
    click_on('Log out')

    # Ensure the logout message appears
    expect(page).to have_content('Signed out successfully.')

    # Login as an employee
    login_employee

    # Go to the employee dashboard
    visit employee_dashboard_page_path

    # Ensure pending orders appears
    expect(page).to have_content('Pending orders')

    # Ensure an order appears from Joe Schmoe
    expect(page).to have_content('Joe Schmoe')

    # Approve the order
    click_on('Approve')

    # Expect the order to decrement the inventory
    expect(StoreItem.all.where(cost: 87.00).first.quantity).to eq(on_hand - 1)
  end


  it 'should not adjust inventory for rejected orders' do

    # Load the database seed if no data exists
    Rails.application.load_seed if Store.count <= 0

    on_hand = StoreItem.all.where(cost: 87.00).first.quantity

    # Login and go to the store page
    login_user
    navigate_to_mystic_store

    # Try to rent a vehicle
    click_on('Rent me!')

    # Application should allow the customer to go to the order page path
    expect(current_path).to eq order_page_path

    # Ensure the order page is displaying correctly
    expect(page).to have_content('Order from Mystic Rently')

    # Send the order to the store
    click_on('Send order')

    # Customer should be brought to the order page
    expect(page).to have_content('Thanks for your order!')

    # Log out as the customer
    click_on('Log out')

    # Ensure the logout message appears
    expect(page).to have_content('Signed out successfully.')

    # Login as an employee
    login_employee

    # Go to the employee dashboard
    visit employee_dashboard_page_path

    # Ensure pending orders appears
    expect(page).to have_content('Pending orders')

    # Ensure an order appears from Joe Schmoe
    expect(page).to have_content('Joe Schmoe')

    # Approve the order
    click_on('Reject')

    # Expect the inventory to be the same as before
    expect(StoreItem.all.where(cost: 87.00).first.quantity).to eq(on_hand)
  end
end