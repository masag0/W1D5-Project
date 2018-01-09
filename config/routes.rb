Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :goals, only: [:new]
  end

  resource :session

  resources :goals, except: [:new]

  root to: "users#index"
end
