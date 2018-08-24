class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {message: "This email is already in use."}

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end
end
