Rails.application.routes.draw do
	# First Created -> Highest Priority
  # See `bin/rake routes`

	root to: "home#index"

  devise_for :users

	resources :hackathons do
    resources :events
	end
end
