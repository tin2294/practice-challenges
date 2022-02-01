require 'sqlite3'
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  results = db.execute("
    SELECT tracks.name, al.title, ar.name FROM tracks
    JOIN albums al ON tracks.album_id = al.id
    JOIN artists ar ON al.artist_id = ar.id
    ")
  return results
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  tracks_in_g = db.execute("
    SELECT COUNT (*) FROM tracks
    JOIN genres g ON tracks.genre_id = g.id
    WHERE g.name = '#{genre_name}'
    ")
  count_tracks = tracks_in_g[0][0]
  songs_length = db.execute("
    SELECT milliseconds FROM tracks
    JOIN genres g ON tracks.genre_id = g.id
    WHERE g.name = '#{genre_name}'
    ")
  songs_length = songs_length.map { |song| song[0].to_f / 60_000 }
  average = songs_length.sum.to_f / count_tracks
  stats = {
    category: genre_name,
    number_of_songs: count_tracks,
    avg_length: average.round(2)
  }
  return stats
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  songs_genre = db.execute("
    SELECT ar.id, ar.name, COUNT (*) AS count_ar FROM tracks
    JOIN genres g ON tracks.genre_id = g.id
    JOIN albums al ON tracks.album_id = al.id
    JOIN artists ar ON al.artist_id = ar.id
    WHERE g.name = '#{genre_name}'
    GROUP BY al.artist_id
    ORDER BY count_ar DESC
    LIMIT 5
    ")
  return songs_genre
end

top_five_artists(db, 'Rock')
