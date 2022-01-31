class User < ActiveRecord::Base
  attr_accessor :email

  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
