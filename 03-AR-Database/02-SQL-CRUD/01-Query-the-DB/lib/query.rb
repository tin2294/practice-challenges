require 'sqlite3'

DATABASE_PATH = File.join(File.dirname(__FILE__), './db/jukebox.sqlite')
DB = SQLite3::Database.new(DATABASE_PATH)

def all_artists(db)
  # TODO: use `db` to execute an SQL query against the database to
  # retrieve all columns from all records from the `artists` table.
  rows = db.execute('SELECT * FROM artists')
end
