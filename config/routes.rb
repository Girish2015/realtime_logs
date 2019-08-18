Rails.application.routes.draw do

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'realtime_log#index'
  get '/test', to: 'realtime_log#test'
end
