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
			genres: tag_list,
			kind: "SHOW",
			cover_image: cover_url,
			poster_image: poster_url,
		}
	end

	def cover_url
		return "/public/defaultCover.jpg" if !cover.attached?
		url_for cover
	end

	def poster_url
		return "/public/defaultPoster.jpg" if !poster.attached?
		url_for poster
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