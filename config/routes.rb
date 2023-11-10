Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :bachelorettes, only: [:index, :show], controller: 'bachelorettes' do
  resources :contestants, only: [:index, :show], controller: "bachelorette_contestants"
end
resources :contestants, only: [:index, :show], controller: 'contestants'
resources :outings, only: [:index, :show, :update], controller: 'outings'


end
