class Season < ApplicationRecord
	has_many :videos, dependent: :destroy
	validates :title, presence: true
	has_one_attached :poster

	def release
		2009
	end

	def poster_image
		if self.poster.attached?
			self.poster
		else
			"/assets/defaultPoster.jpg"
		end
	end
end