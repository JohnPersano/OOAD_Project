
Rails.application.routes.draw do

  # Generate all employee routes
  devise_for :employees

  # Generate all customer routes
  devise_for :customers, controllers: { registrations: 'customers/registrations' }

  root 'page#home'

  get '/findLocation', to: 'page#find_location', as: 'find_location_page'
  get '/store', to: 'page#store', as: 'store_page'

  get '/order', to: 'page#order', as: 'order_page'
  get '/thanks', to: 'page#order_submitted', as: 'order_submitted_page'
  get '/order-action', to: 'page#order_action', as: 'order_action_page'

  get '/employee_dashboard', to: 'page#employee_dashboard', as: 'employee_dashboard_page'

end
