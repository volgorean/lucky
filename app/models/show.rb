class Show < ApplicationRecord
	has_many :videos, dependent: :destroy
	has_many :seasons, dependent: :destroy
	validates :title, presence: true
	has_one_attached :poster
	has_one_attached :cover
	acts_as_taggable

	def kind
		"TV SHOW"
	end

	def link
		"/shows/#{id}"
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
		else
			"/assets/defaultPoster.jpg"
		end
	end
end