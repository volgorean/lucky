class VideosController < ApplicationController
	def home
		@new = []
		@action = []
		@drama = []
		@fantasy = []
		
		Video
			.where(collection_id: nil)
			.order("created_at DESC")
			.limit(6)
			.each { |v| @new << v }
		Collection
			.all
			.order("created_at DESC")
			.limit(6)
			.each { |c| @new << c }
		@new.sort_by!(&:created_at)

		@action = @new
		@drama = @new
		@fantasy = @new
	end

	def index
		@results = Video.where(collection_id: nil).order("title ASC").group_by{|u| u.title[0]}
	end

	def show
		@video = Video.find(params[:id])
	end

	def stream
		video = Video.find(params[:id])
		path = Rails.root.to_s + '/storage/vg/Mr/' + video.file.blob.key
		
		send_file(
			path,
			range: true,
			buffer_size: 500_000,
			disposition: "inline",
			type: video.file.content_type)
	end
end