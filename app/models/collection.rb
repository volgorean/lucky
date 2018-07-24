class Collection < ApplicationRecord
	has_many :videos, dependent: :destroy
	validates :title, presence: true
	has_one_attached :thumbnail
	acts_as_taggable

	def kind
		"TV SHOW"
	end

	def link
		"/shows/#{id}"
	end

	def thumbnail_image
		if self.thumbnail.attached?
			self.thumbnail
		else
			"/assets/defaultThumb.jpg"
		end
	end
end