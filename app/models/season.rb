class Season < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_many :videos, dependent: :destroy
	validates :title, presence: true
	has_one_attached :poster

	def as_hash
		{
			id: id,
			title: title,
			description: description,
			release: "2009",
			kind: "SEASON",
			show_id: show_id,
			season_number: season_number,
			poster_image: poster_url,
		}
	end

	def poster_url
		if poster.attached?
			url_for poster
		else
			"/public/defaultPoster.jpg"
		end
	end
end