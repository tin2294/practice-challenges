def reversed_sorted_artists
  # TODO: return an ActiveRecord::Relation (array) of Artist, in reversed alphabetical order
  Artist.all.order(name: :desc)
end

def love_tracks
  # TODO: return an ActiveRecord::Relation (array) of Track which sings about Love
  Track.where("name LIKE ?", "%love%")
end

def long_tracks(min_length)
  # TODO: return an ActiveRecord::Relation (array) of Track of at least `min_length` minutes
  min_length_ms = min_length * 60_000
  Track.where("milliseconds >= #{min_length_ms}")
end

def top_five_artists(genre_name)
  # TODO: return the 5 artists with the most tracks of genre `genre_name`
  artists = Artist.joins(tracks: :genre).select('artists.name', 'COUNT(*)').group(:artist_id)
  return artists.order('COUNT(*) DESC').where("genres.name = '#{genre_name}'").limit(5)
end
