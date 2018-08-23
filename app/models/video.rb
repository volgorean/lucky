class Video < ApplicationRecord
	belongs_to :show, optional: true
	belongs_to :season, optional: true
	validates :title, presence: true
	has_one_attached :file
	has_one_attached :poster
	has_one_attached :cover
	acts_as_taggable

	def kind
		if show_id
			"EPISODE"
		else
			"MOVIE"
		end
	end

	def link
		if show_id
			"/shows/#{show_id}/episodes/#{id}"
		else
			"/movies/#{id}"
		end
	end

	def runtime
		time_ago_in_words(runtime_s.seconds.from_now)
	end

	def cover_image
		if self.cover.attached?
			self.cover
		else
			"/assets/defaultCover.jpg"
		end
	end

	def poster_image
		if self.poster.attached?
			self.poster
		elsif self.season_id
			self.season.poster_image
		else
			"/assets/defaultPoster.jpg"
		end
	end

	def file_content_type
		if self.file.attached?
			self.file.content_type
		else
			"mp4"
		end
	end
end