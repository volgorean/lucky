class Season < ApplicationRecord
	include Rails.application.routes.url_helpers
	belongs_to :show, optional: true
	has_many :videos, dependent: :destroy
	validates :title, presence: true
	has_one_attached :poster

	def as_hash
		{
			id: id,
			title: title,
			description: description,
			kind: "SEASON",
			show_id: show_id,
			season_number: season_number,
			poster_image: poster_url,
		}
	end

	def poster_url
		return "/public/defaultPoster.jpg" if poster.attached?
		url_for poster
	end
end