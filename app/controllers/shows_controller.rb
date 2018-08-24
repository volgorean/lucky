class ShowsController < ApplicationController
	before_action :authenticated?

	def index
		shows = Show
			.includes(:tags)
			.all
			.order("title ASC")
			.map(&:as_hash)
		render json: {
			results: shows
		}.to_json
	end
	
	def show
		show = Show.includes(:seasons, :videos, :tags).find(params[:id])
		seasons = show.seasons.sort_by(&:season_number).map(&:as_hash)
		episodes = show.videos.group_by(&:season_id)

		render json: {
			result: show.as_hash.merge(
				seasons: seasons.map { |s|
					s.merge(episodes: episodes[s[:id]].map(&:as_hash))
				}
			)
		}.to_json
	end
end