require 'rails_helper'

describe 'Home page navigation behavior' do

  it 'should navigate to "Find a location"' do
    visit root_path

    expect(page).to have_content('Latest news')

    click_link('Find a location')

    expect(current_path).to eq(find_location_page_path)
  end

end