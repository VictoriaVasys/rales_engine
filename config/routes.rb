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

      namespace :items do
        get 'random', to: 'random#show'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
      end

      resources :items, only: [:index, :show] do
        get :invoice_items, to: 'items/invoice_items#index'
        get :merchant, to: 'items/merchant#show'
      end

      namespace :invoice_items do
        get 'random', to: 'random#show'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
      end

      resources :invoice_items, only: [:index, :show] do
        get :invoice, to: 'invoice_items/invoice#show'
        get :item, to: 'invoice_items/item#show'
      end

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end

      resources :customers, only: [:index, :show] do
        get :transactions, to: 'customers/transactions#index'
        get :invoices, to: 'customers/invoices#index'
      end

      namespace :merchants do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end

      resources :merchants, only: [:index, :show] do
        get :items, to: 'merchants/items#index'
        get :invoices, to: 'merchants/invoices#index'
      end

      namespace :transactions do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      resources :transactions, only: [:index, :show] do
        get :invoice, to: 'transactions/invoice#show'
      end

    end
  end

end
