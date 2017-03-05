class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  acts_as_followable
  acts_as_follower
  has_many	:posts
  validates   :name, presence: true
  validates   :uname, presence: true, uniqueness: true
  # paginates_per 5
end
