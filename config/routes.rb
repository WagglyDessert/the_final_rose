Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :bachelorettes, only: [:index, :show], controller: 'bachelorettes' do
  resources :contestants, only: [:index, :show], controller: "bachelorette_contestants"

  #get "/bachelorettes/:id", to: "bachelorettes#show"
  #get "/bachelorettes/:id/contestants", to: "bachelorette_contestants#index"
  end
end
