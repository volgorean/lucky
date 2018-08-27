class VideosController < ApplicationController
	# stream exception to be removed with stream endpoint when adding file server.
	# Issue exists bc using JWT auth not session and stream is src.
	before_action :authenticated?, except: :stream
	
	def index
		vids = Video
			.includes(:tags)
			.where(show_id: nil)
			.order("title ASC")
			.map(&:as_hash)
		render json: {
			results: vids
		}.to_json
	end

	def search
		v = Video
			.includes(:tags)
			.where(show_id: nil)
			.with_term(params["search"])
			.with_genre(params["genre"])
			.order("release DESC")

		s = Show
			.includes(:tags)
			.all
			.with_term(params["search"])
			.with_genre(params["genre"])
			.order("release DESC")

		render json: {
			results: (v+s).sort_by!(&:release).map(&:as_hash)
		}.to_json
	end

	def show
		vid = Video.find(params["id"])
		render json: {
			result: vid.as_hash
		}.to_json
	end

	# to be removed with the addition of a file server.
	def stream
		video = Video.find(params[:id])

		if video.file.attached?
			file_path = ActiveStorage::Blob.service.send(:path_for, video.file.blob.key)
			file_type = video.file.content_type
		else
			file_path = Rails.root.to_s + "/public/defaultVideo.mp4"
			file_type = "video/mp4"
		end

		# rails doesnt support file partial requests by default
		# gem: send_file_with_range
		send_file(
			file_path,
			range: true,
			buffer_size: 500_000,
			disposition: "inline",
			type: file_type)
	end
end