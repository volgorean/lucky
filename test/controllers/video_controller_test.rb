require 'test_helper'

class VideoControllerTest < ActionDispatch::IntegrationTest
	def setup
  	token = JsonWebToken.encode({
		  user_id: users(:bilbo).id,
		  created_at: Time.now.to_i
		})

		@headers = {
  		"Authorization" => "Bearer #{token}"
  	}
	end

  test "index gets only movies" do
  	get movies_url, headers: @headers
  	assert_response :success

  	body = JSON.parse(response.body)
  	assert_equal 1, body["results"].length, "wrong number of results (should only return movies)"
  end

  test "search all movies and shows when empty parameters but not individual episodes" do
  	get search_url, headers: @headers
  	assert_response :success

  	body = JSON.parse(response.body)
  	assert_equal 2, body["results"].length, "wrong number of results (should not return episodes)"
  end
end
