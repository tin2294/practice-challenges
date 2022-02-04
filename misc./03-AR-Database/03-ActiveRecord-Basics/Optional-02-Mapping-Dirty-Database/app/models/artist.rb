class Artist < ActiveRecord::Base
  self.primary_key = "artist_code"
  self.table_name = "ARTIST"

  has_many :albums, foreign_key: 'id_artist'
  has_many :tracks, through: :albums

  validates_presence_of :name
end
