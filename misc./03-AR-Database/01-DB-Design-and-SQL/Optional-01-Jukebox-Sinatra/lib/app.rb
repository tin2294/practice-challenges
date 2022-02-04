require "sinatra"
require "sinatra/reloader" if development?
require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))

results = DB.execute('SELECT name,id FROM artists')

get "/" do
  # TODO: Gather all artists to be displayed on home page
  @results = DB.execute('SELECT name,id FROM artists')
  erb :home # Will render views/home.erb file (embedded in layout.erb)
end

# Then:
# 1. Create an artist page with all the albums. Display genres as well
get '/artists/:id' do
  puts params[:id]
  @artist = params[:id]
  @albums = DB.execute("SELECT al.title, al.id FROM albums al
    JOIN artists ar ON al.artist_id = ar.id WHERE ar.id = #{@artist}")
  erb :artist_page
end
# 2. Create an album pages with all the tracks
get '/albums/:id2' do
  puts params[:id2]
  @album = params[:id2]
  @tracks = DB.execute("SELECT t.name, t.id FROM tracks t
    JOIN albums a ON t.album_id = a.id WHERE a.id = #{@album}")
  erb :album_page
end
# 3. Create a track page with all the track info
get '/tracks/:id3' do
  puts params[:id3]
  @track = params[:id3]
  @track_info = DB.execute("SELECT * FROM tracks
    WHERE tracks.id = #{@track}")
  erb :track_page
end
