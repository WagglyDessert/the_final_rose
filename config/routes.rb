Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :bachelorettes, only: [:index, :show], controller: 'bachelorettes' do
  resources :contestants, only: [:index, :show], controller: "bachelorette_contestants"
end
resources :contestants, only: [:index, :show], controller: 'contestants'
resources :outings, only: [:index, :show], controller: 'outings'

patch "/outings/:id", to: "outings#update"


  #get "/bachelorettes/:id", to: "bachelorettes#show"
  #get "/bachelorettes/:id/contestants", to: "bachelorette_contestants#index"
end
