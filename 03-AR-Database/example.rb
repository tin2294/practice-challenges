class Post < ActiveRecord::Base
  belongs_to :user
  # TODO: Add some validation
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }

  validates :url, presence: true, format: {
    with: /\Ahttp:\/\/.+\z/i
  }

  validates :user, presence: true
  before_validation :strip_text

  def strip_text
    url.strip
  end
end

what is the url?
"www.kjdfnjkdf.com "
what is your email?
" cdkcm@ckkmd.com "
