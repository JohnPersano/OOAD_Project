require 'rails_helper'

describe 'Find location page navigation behavior' do

  it 'should find all locations within a State' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in the CT form field with CT since that is what the seed data is
    select('CT', from: 'state')

    # Submit the search
    find_button('submit').click

    # Page should have seed data results
    expect(page).to have_content('Mystic Rently')
    expect(page).to have_content('Milford Rently')
  end

  it 'should find all locations within a zipcode' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in '06355' as the Zipcode (Mystic)
    fill_in 'zipcode', with: '06355'

    # Submit the search
    find_button('submit').click

    # Page should have Mystic but not Milford
    expect(page).to have_content('Mystic Rently')
    expect(page).not_to have_content('Milford Rently')
  end

  it 'should find all locations within a city' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in 'Mystic' as the city
    select('CT', from: 'state')
    fill_in 'city', with: 'Mystic'

    # Submit the search
    find_button('submit').click

    # Page should have Mystic but not Milford
    expect(page).to have_content('Mystic Rently')
    expect(page).not_to have_content('Milford Rently')
  end

  it 'should find no locations for an unknown query' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in 'Mystic' as the city
    select('VA', from: 'state')

    # Submit the search
    find_button('submit').click

    # Page should not have either seed data
    expect(page).not_to have_content('Mystic Rently')
    expect(page).not_to have_content('Milford Rently')
  end

  it 'should transition to location page upon selection' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in 'Mystic' as the city
    select('CT', from: 'state')
    fill_in 'city', with: 'Mystic'

    # Submit the search
    find_button('submit').click

    # Page should not have either seed data
    expect(page).to have_content('Mystic Rently')
    expect(page).not_to have_content('Milford Rently')

    click_on('Check inventory')

    # Page should have store inventory header text
    expect(page).to have_content('Store inventory')

  end

  it 'should show vehicle inventory for a particular store' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in 'Mystic' as the city
    select('CT', from: 'state')
    fill_in 'city', with: 'Mystic'

    # Submit the search
    find_button('submit').click

    # Page should not have either seed data
    expect(page).to have_content('Mystic Rently')
    expect(page).not_to have_content('Milford Rently')

    click_on('Check inventory')

    # Page should have store inventory header text
    expect(page).to have_content('Store inventory')

    # Mystic store should have the following store items
    expect(page).to have_content('1995 Chevy Camaro')
    expect(page).to have_content('2018 Chevy Corvette')
  end

  it 'should not show vehicle inventory for any other store than the one selected' do
    # Ensure the database is populated
    RentlyApplication.instance.stores = DataGenerator.instance.get_store_data

    visit find_location_page_path

    # Page should show header text
    expect(page).to have_content('Find a Rently location close to you')

    # Fill in 'Mystic' as the city
    select('CT', from: 'state')
    fill_in 'city', with: 'Milford'

    # Submit the search
    find_button('submit').click

    # Page should not have either seed data
    expect(page).to have_content('Milford Rently')
    expect(page).not_to have_content('Mystic Rently')

    click_on('Check inventory')

    # Page should have store inventory header text
    expect(page).to have_content('Store inventory')

    # Milford store should NOT have the following store items
    expect(page).not_to have_content('1995 Chevy Camaro')
    expect(page).not_to have_content('2018 Chevy Corvette')
  end

end
