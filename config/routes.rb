Rails.application.routes.draw do
  root 'page#home'

  get '/findLocation', to: 'page#find_location', as: 'find_location_page'
  get '/store', to: 'page#store', as: 'store_page'

end
