class VideosController < ApplicationController
	def home
		@new = []
		@action = []
		@drama = []
		@comedy = []
		
		Video
			.where(show_id: nil)
			.order("release DESC")
			.limit(9)
			.each { |v| @new << v }
		Show
			.all
			.order("release DESC")
			.limit(9)
			.each { |c| @new << c }
		@new.sort_by!(&:release)

		Video
			.tagged_with("Action")
			.where(show_id: nil)
			.order("release DESC")
			.limit(9)
			.each { |v| @action << v }
		Show
			.tagged_with("Action")
			.order("release DESC")
			.limit(9)
			.each { |c| @action << c }
		@action.sort_by!(&:release)

		Video
			.tagged_with("Drama")
			.where(show_id: nil)
			.order("release DESC")
			.limit(9)
			.each { |v| @drama << v }
		Show
			.tagged_with("Drama")
			.order("release DESC")
			.limit(9)
			.each { |c| @drama << c }
		@drama.sort_by!(&:release)

		Video
			.tagged_with("Comedy")
			.where(show_id: nil)
			.order("release DESC")
			.limit(9)
			.each { |v| @comedy << v }
		Show
			.tagged_with("Comedy")
			.order("release DESC")
			.limit(9)
			.each { |c| @comedy << c }
		@comedy.sort_by!(&:release)
	end

	def index
		@results = Video.where(show_id: nil).order("title ASC").group_by{|u| u.title[0]}
	end

	def show
		@video = Video.find(params[:id])
	end

	def stream
		video = Video.find(params[:id])
		path = ActiveStorage::Blob.service.send(:path_for, video.file.blob.key)
		
		send_file(
			path,
			range: true,
			buffer_size: 500_000,
			disposition: "inline",
			type: video.file.content_type)
	end
end