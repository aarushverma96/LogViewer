require 'resque/server'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  mount Resque::Server => '/resque'

  get '/logs/:env' => "logs#index"
end
