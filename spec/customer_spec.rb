require 'rails_helper'

describe('Customer login behavior') do

  it 'should navigate to the login page' do
    visit new_customer_session_path

    expect(page).to have_content('Log in')
  end

  it 'should not allow unknown customers to login' do
    # Delete all customers from the database
    Customer.delete_all

    # Visit the login page
    visit new_customer_session_path

    # Enter test customer data
    fill_in 'customer_email', with: 'test@example.com'
    fill_in 'customer_password', with: 'test123'

    # Submit the customer data
    find_button('Log in').click

    # Verify page has not transitioned somewhere
    expect(page).to have_content('Log in')

    # Verify page has error displayed
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'should allow known customers to login' do
    # Delete all customers from the database
    Customer.delete_all

    # Create a test customer
    customer = Customer.create!(email: 'test@rently.com',
                                password: 'test123',
                                name: 'John',
                                license_id: 123_456_789,
                                dob: 18.years.ago)

    # Visit the login page
    visit new_customer_session_path

    # Enter test customer data
    fill_in 'customer_email', with: customer.email
    fill_in 'customer_password', with: customer.password

    # Submit the customer data
    find_button('Log in').click

    # Verify page has transitioned to the home page
    expect(current_path).to eq root_path
  end

  it 'should navigate to customer sign up' do

    # Visit the login page
    visit new_customer_session_path

    # Click the signup link
    click_link('Sign up')

    # Verify page has transitioned to the sign up page
    expect(current_path).to eq '/customers/sign_up'

  end
end

describe('Customer signup behavior') do

  it 'should navigate to the sign up page' do
    visit new_customer_registration_path

    expect(page).to have_content('Sign up')
  end

  it 'should not allow new invalid customer signup' do
    # Delete all customers from the database
    Customer.delete_all

    # Ensure no customers exist
    expect(Customer.count).to eq 0

    # Visit the login page
    visit new_customer_registration_path

    # Enter test customer data
    fill_in 'customer_email', with: 'test!example.com'
    fill_in 'customer_password', with: 'test123'
    fill_in 'customer_password_confirmation', with: 'test333'
    fill_in 'customer_name', with: 'J'
    fill_in 'customer_license_id', with: '23456789'
    select('2015', from: 'customer_dob_1i')

    # Submit the customer data
    find_button('Sign up').click

    # Verify page has not transitioned to any other page
    expect(page).to have_content('Sign up')

    # Ensure only no customers were created
    expect(Customer.count).to eq 0
  end


  it 'should allow new valid customer signup' do
    # Delete all customers from the database
    Customer.delete_all

    # Ensure no customers exist
    expect(Customer.count).to eq 0

    # Visit the login page
    visit new_customer_registration_path

    # Enter test customer data
    fill_in 'customer_email', with: 'test@example.com'
    fill_in 'customer_password', with: 'test123'
    fill_in 'customer_password_confirmation', with: 'test123'
    fill_in 'customer_name', with: 'Johnny Test'
    fill_in 'customer_license_id', with: '123456789'
    select('1975', from: 'customer_dob_1i')

    # Submit the customer data
    find_button('Sign up').click

    # Verify page has transitioned to the home page
    expect(current_path).to eq root_path

    # Ensure only one customer exists now
    expect(Customer.count).to eq 1
  end




end