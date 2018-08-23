class ShowsController < ApplicationController
	def show
		@show = Show.includes(:seasons, :videos).find(params[:id])
		@seasons = @show.seasons.sort_by(&:season_number)
		@episodes = @show.videos.group_by(&:season_id)
	end

	def index
		@results = Show.all.order("title ASC").group_by{|u| u.title[0]}
	end
end