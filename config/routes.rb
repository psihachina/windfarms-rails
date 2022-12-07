Rails.application.routes.draw do
  # get 'turbines', to: 'turbines#index'
  # post 'turbines', to: 'turbines#create'
  resources :turbines
end
