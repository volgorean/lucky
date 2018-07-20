Rails.application.routes.draw do
  namespace :admin do
      resources :collections
      resources :videos

      root to: "collections#index"
    end
	get "/movies/:id", to: "videos#show"
	get "/shows/:id", to: "collections#show"
	get "/shows/:c_id/episodes/:id", to: "videos#show"
	get "/stream/:id", to: "videos#stream"

	root "videos#index"
end
