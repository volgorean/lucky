class CollectionsController < ApplicationController
	def show
		@collection = Collection.find(params[:id])
		@seasons = @collection.videos
			.sort_by(&:season_pos)
			.group_by(&:season_id)
	end
end