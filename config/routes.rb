Rails.application.routes.draw do
  get '/home' => 'home#index'
  post '/updateData' => 'home#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
