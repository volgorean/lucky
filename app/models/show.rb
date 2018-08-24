class Show < ApplicationRecord
	include Rails.application.routes.url_helpers
	
	has_many :videos, dependent: :destroy
	has_many :seasons, dependent: :destroy
	validates :title, presence: true
	has_one_attached :poster
	has_one_attached :cover
	acts_as_taggable

	def as_hash
		{
			id: id,
			title: title,
			description: description,
			kind: "SHOW",
			cover_image: cover_url,
			poster_image: poster_url,
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
		else
			"/public/defaultPoster.jpg"
		end
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