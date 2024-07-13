Rails.application.routes.draw do
  root "welcome#index"
  post 'transaction', action: :create, controller: 'transaction'
end
