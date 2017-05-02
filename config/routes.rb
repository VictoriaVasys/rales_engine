Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'invoices/random', to: 'invoices#show'
      get 'invoices/find', to: 'invoices#show'
      get 'invoices/find_all', to: 'invoices#index'
      resources :invoices, only: [:index, :show]
    end
  end

end
