require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "validates user" do
  	user = users(:bilbo)
  	assert user.valid?, "valid user is invalid"
  end

  test "invalid with duplicate email" do
  	user = users(:bilbo).dup
  	refute user.valid?, "user is valid with duplicate email"
  	refute_nil user.errors[:email], "no validation error for email duplicate"
  end

  test "invalid without email" do
  	user = users(:bilbo).dup
  	user.email = nil
  	refute user.valid?, "user is valid without email"
  	refute_nil user.errors[:email], "no validation error for email present"
  end
end
