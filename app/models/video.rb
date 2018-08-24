class Video < ApplicationRecord
	include ActionView::Helpers::DateHelper
	include Rails.application.routes.url_helpers

	belongs_to :show, optional: true
	belongs_to :season, optional: true
	validates :title, presence: true
	has_one_attached :file
	has_one_attached :poster
	has_one_attached :cover
	acts_as_taggable

	def as_hash
		{
			id: id,
			title: title,
			description: description,
			genres: genres,
			kind: (show_id ? "EPISODE" : "MOVIE"),
			release: release,
			runtime: time_ago_in_words(runtime_s.seconds.from_now),
			cover_image: cover_url,
			poster_image: poster_url,
			content_path: "/stream/#{id}",
			content_type: (file.attached? ? file.content_type : "video/mp4")
		}
	end

	def cover_url
		if cover.attached?
			url_for cover
		else
			"/public/defaultCover.jpg"
		end
	end

	def poster_url
		if poster.attached?
			url_for poster
		elsif show_id
			self.season.poster_url
		else
			"/public/defaultPoster.jpg"
		end
	end

	def genres
		show_id ? self.show.tag_list : tag_list
	end

	def self.with_genre(val)
		val ? self.tagged_with(val) : self
	end

	def self.with_term(val)
		if val
			self.where("title LIKE :search OR description LIKE :search", search: "%#{val}%")
		else
			self
		end
	end
end