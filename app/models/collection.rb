class Collection < ApplicationRecord
	has_many :videos, dependent: :destroy
	validates :title, presence: true
	has_one_attached :thumbnail
	
	def kind
		"TV SHOW"
	end

	def release
		"2008-2012"
	end

	def genres
		"Drama, Action"
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