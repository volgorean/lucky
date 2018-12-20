require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "login returns valid token" do
  	post login_url, params: {email: "bilbo@shire.gov", password: "hunter1"}
  	assert_response :success

  	body = JSON.parse(response.body)
		token = body.dig("user", "token")  	
  	id = JsonWebToken.decode(token).dig(0, "user_id")
  	assert_equal users(:bilbo).id, id, "JWT token invalid"
  end
end
