# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    DB.results_as_hash = true
    ids = DB.execute("SELECT id FROM posts")
    id_arr = ids.map { |i| i["id"] }
    if id_arr.include?(id)
      queries = DB.execute("SELECT * FROM posts WHERE id = ?", id)
      query = queries.first
      post = Post.new(title: query['title'], id: query['id'], url: query['url'], votes: query['votes'])
    end
  end

  def self.all
    DB.results_as_hash = true
    queries = DB.execute("SELECT * FROM posts")
    queries.map { |x| x = Post.new(title: x['title'], id: x['id'], url: x['url'], votes: x['votes']) }
  end
end
