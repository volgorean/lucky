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
			kind: kind,
			release: release,
			runtime: time_ago_in_words(runtime_s.seconds.from_now),
			cover_image: cover_url,
			poster_image: poster_url,
			content_path: "/stream/#{id}",
			content_type: (file.attached? ? file.content_type : "video/mp4")
		}
	end

	def cover_url
		return "/public/defaultCover.jpg" if !cover.attached?
		url_for cover
	end

	def poster_url
		if !poster.attached?
			return self.season.poster_url if show_id
			return "/public/defaultPoster.jpg"
		end

		url_for poster
	end

	def kind
		(show_id ? "EPISODE" : "MOVIE")
	end

	def genres
		return self.show.tag_list if show_id
		tag_list
	end

	def self.with_genre(val)
		return self if val.nil?
		self.tagged_with(val)
	end

	def self.with_term(val)
		return self if val.nil?
		self.where("title LIKE :search OR description LIKE :search", search: "%#{val}%")
	end
end