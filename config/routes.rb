Rails.application.routes.draw do
  root "welcome#index"
  resources :transaction, only: :create do
    post '/chargeback', to: 'transaction#chargeback', as: 'chargeback'
  end
end
