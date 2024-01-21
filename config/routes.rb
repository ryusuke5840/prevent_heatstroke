Rails.application.routes.draw do
  root 'get_temperature#index'
  post 'send_data', to: 'get_temperature#receive_data'
  get 'show_data', to: 'get_temperature#index'
  get 'show_detail', to: 'get_temperature#detail'
  get 'csv', to: 'get_temperature#csv'
end
