require 'bcrypt'
# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :session_token, presence: true, uniqueness:true
  validates :password_digest, presence: {message: 'Password can\'t be blank'}
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    match = BCrypt::Password.new(user.password_digest).is_password?(password)
    return match ? user : nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
end
