Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # First Created -> Highest Priority
  # See `bin/rake routes`

  root to: "home#index"

  # Documents
  get '/docs/:doc' => 'documents#show'
  get '/rules/:type' => 'documents#rules'
  get '/about' => 'documents#about'

  # Users
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users

  # Omniauth
  resources :authentications do
    member do
      get 'callback' => 'authentications#create'
    end
  end

  # Events
  resources :events do
    # Polls represent a round of voting with a set of participants
    resources :polls do
      # Ballots represent a set of votes cast by a user in a poll
      resources :ballots
    end
    # Teams represent a set of people at the hackathon
    resources :teams
    # Participants represent a person at the hackathon event
    resources :participants
  end
end
