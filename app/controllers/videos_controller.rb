class VideosController < ApplicationController
	def index
		@results = []
		
		Video.where(collection_id: nil).all.each do |v|
			@results << v
		end
		
		Collection.all.each do |c|
			@results << c
		end
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