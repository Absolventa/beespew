Rails.application.routes.draw do
  root 'support_requests#new'

  resources :support_requests

end
