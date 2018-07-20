class Collection < ApplicationRecord
	has_many :videos, dependent: :destroy
	validates :title, presence: true

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
end