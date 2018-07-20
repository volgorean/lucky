class Video < ApplicationRecord
	belongs_to :collection, optional: true
	validates :title, presence: true
	has_one_attached :file

	def kind
		if collection_id
			"EPISODE"
		else
			"MOVIE"
		end
	end

	def genres
		"Sci-Fi"
	end

	def link
		if collection_id
			"/shows/#{collection_id}/episodes/#{id}"
		else
			"/movies/#{id}"
		end
	end

	def runtime
		time_ago_in_words(runtime_s.seconds.from_now)
	end
end