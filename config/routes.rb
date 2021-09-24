Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights

  delete '/flights/:flight_id/:passenger_id', to: 'flight_passengers#destroy'
end
