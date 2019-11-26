Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # allocated random phone number
  post '/phones', to: 'phone_numbers#create'
  # allocate specific phone number
  post '/phones/:id', to: 'phone_numbers#allocate_custom_number'
  # get all allocated phone numbers
  get '/phones', to: 'phone_numbers#index'
end
