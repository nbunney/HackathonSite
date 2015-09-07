Rails.application.routes.draw do
  # First Created -> Highest Priority
  # See `bin/rake routes`

  root to: "home#index"

  get '/docs/:doc' => 'documents#show'
  get '/rules/:type' => 'documents#rules'
  get '/about' => 'documents#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users

  resources :events do
    resources :sponsorships
    resources :prizes
    resources :teams
  end
end
