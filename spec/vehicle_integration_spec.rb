require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('route path / index page', {:type => :feature}) do
  it('displays the index page  when user goes to / in browser') do
    visit('/')
    # fill_in('TEMPLATE', :with => 'SOMETHING')
    # click_button('Enter')
    # save_and_open_page
    expect(page).to have_content('Welcome to Dealership Central')
  end

  it('displays the /dealerships/new page when user clicks Add New Dealership link') do
    visit('/')
    click_link('Add New Dealership')
    # fill_in('TEMPLATE', :with => 'SOMETHING')
    # click_button('Enter')
    # save_and_open_page
    expect(page).to have_content('Add dealerships')
  end

  it('displays the /dealerships page when user clicks See Dealership List link') do
    visit('/')
    click_link('See Dealership List')
    # fill_in('TEMPLATE', :with => 'SOMETHING')
    # click_button('Enter')
    # save_and_open_page
    expect(page).to have_content('Dealerships')
  end
end

describe('/dealerships/new page', {:type => :feature}) do
  it('displays a form where user can add a new dealership') do
    visit('/dealerships/new')
    fill_in('name', :with => 'my dealership')
    click_button('Add Dealership')

    expect(page).to have_content('Success')
  end
end

describe('/dealerships page', {:type => :feature}) do
  it('displays page header dealerships') do
    visit('/dealerships')
    # fill_in('name', :with => 'my dealership')
    # click_button('Add Dealership')

    expect(page).to have_content('Dealerships')
  end
end

describe('/dealerships page', {:type => :feature}) do
  it('displays See Vehicle List Add New Vehicle links') do
    visit('/dealerships/new')
    fill_in('name', :with => 'my dealership')
    click_button('Add Dealership')

    click_link('add_vehicle')

    expect(page).to have_content('Add a vehicle:')
  end
end
