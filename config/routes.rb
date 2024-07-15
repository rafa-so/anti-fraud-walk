Rails.application.routes.draw do
  root "welcome#index"
  resources 'transaction', only: :create
end
