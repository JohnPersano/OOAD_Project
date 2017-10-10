
Rails.application.routes.draw do

  # Generate all employee routes
  devise_for :employees

  # Generate all customer routes
  devise_for :customers, controllers: { registrations: 'customers/registrations' }

  root 'page#home'

  get '/findLocation', to: 'page#find_location', as: 'find_location_page'
  get '/store', to: 'page#store', as: 'store_page'

  get '/employee_dashboard', to: 'page#employee_dashboard', as: 'employee_dashboard_page'

end
