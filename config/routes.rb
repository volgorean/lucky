Rails.application.routes.draw do
  namespace :admin do
      resources :collections
      resources :videos

      root to: "collections#index"
    end
  get "/movies", to: "videos#index"
	get "/movies/:id", to: "videos#show"
  get "/shows", to: "collections#index"
	get "/shows/:id", to: "collections#show"
	get "/shows/:c_id/episodes/:id", to: "videos#show"
	get "/stream/:id", to: "videos#stream"

	root "videos#home"
end
