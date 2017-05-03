Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :invoices do
        get 'random', to: 'random#show'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
      end
      resources :invoices, only: [:index, :show] do
        get :transactions, to: 'invoices/transactions#show'
        get :invoice_items, to: 'invoices/invoice_items#show'
        get :items, to: 'invoices/items#show'
        get :customer, to: 'invoices/customers#show'
        get :merchant, to: 'invoices/merchants#show'
      end
      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      resources :customers, only: [:index, :show] do
      end
      namespace :merchants do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      resources :merchants, only: [:index, :show] do
      end
    end
  end

end
