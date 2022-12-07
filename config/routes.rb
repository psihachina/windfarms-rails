Rails.application.routes.draw do
  # get 'turbines', to: 'turbines#index'
  # post 'turbines', to: 'turbines#create'
  resources :turbines do
    get :expensive, on: :collection
  end
end
