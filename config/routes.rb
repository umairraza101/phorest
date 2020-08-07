Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vouchers, only: [:new, :create]
  root 'clients#index' # shortcut for the above
end
