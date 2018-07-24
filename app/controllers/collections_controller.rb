class CollectionsController < ApplicationController
	def show
		@collection = Collection.find(params[:id])
		@seasons = @collection.videos
			.sort_by(&:season_pos)
			.group_by(&:season_id)
	end

	def index
		@results = Collection.all.order("title ASC").group_by{|u| u.title[0]}
	end
end