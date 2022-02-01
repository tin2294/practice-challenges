class User < ActiveRecord::Base
  has_many :posts

  # TODO: Add some validation
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
  before_validation :strip_email
  after_validation :welcome
  # TODO: Add some callbacks

  private

  def strip_email
    self.email = email.strip if email?
  end

  def welcome
    FakeMailer.instance.mail(email, 'Welcome!')
  end
end
