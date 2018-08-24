Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  get "/search", to: "videos#search"
  get "/stream/:id", to: "videos#stream"
  get "/movies", to: "videos#index"
	get "/movies/:id", to: "videos#show"
  get "/shows", to: "shows#index"
	get "/shows/:id", to: "shows#show"
	get "/shows/:c_id/episodes/:id", to: "videos#show"
	root "videos#home"
end
