class User < ApplicationRecord
  has_secure_password
  has_many :products
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 5}
end
#  left off in vid at 13:22
#  https://vimeo.com/202330229/9eb995a3f7