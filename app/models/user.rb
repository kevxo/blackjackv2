class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }, presence: true
  validates :password, confirmation: true
end
