Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :invoices do
        get 'random', to: 'find#show'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
      end
      resources :invoices, only: [:index, :show] do
        get :transactions, to: 'invoices/relations#show' 
      end
    end
  end

end
