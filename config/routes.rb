Rails.application.routes.draw do
  namespace :admin do
    resources :shows
    resources :videos

    root to: "shows#index"
  end

  get "/login", to: "sessions#login_page", as: :login_page
  post "/login", to: "sessions#login", as: :login

  get "/movies", to: "videos#index"
	get "/movies/:id", to: "videos#show"
  get "/shows", to: "shows#index"
	get "/shows/:id", to: "shows#show"
	get "/shows/:c_id/episodes/:id", to: "videos#show"
	get "/stream/:id", to: "videos#stream"

	root "videos#home"
end
