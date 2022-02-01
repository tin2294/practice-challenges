require 'sqlite3'

db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  results = db.execute("SELECT COUNT (*) FROM artists")
  return results[0][0]
end

def number_of_rows(db, table_name)
  results = db.execute("SELECT COUNT (*) FROM #{table_name}")
  return results[0][0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  results = db.execute("SELECT name FROM artists ORDER BY name ASC")
  return results.map { |artist| artist[0] }
end

def love_tracks(db)
  # TODO: return array of love songs' names
  results = db.execute("SELECT tracks.name FROM tracks WHERE name LIKE '%love%'")
  return results.map { |song| song[0] }
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  results = db.execute("SELECT tracks.name
    FROM tracks WHERE milliseconds > #{min_length * 60_000} ORDER BY milliseconds ASC")
  return results.map { |song| song[0] }
end

p artist_count(db)
