Rails.application.routes.draw do

  root 'page#home'

  # Static pages
  PageController.action_methods.each do |action|
    get "/#{action}", to: "page##{action}", as: "#{action}_page"
  end
end
