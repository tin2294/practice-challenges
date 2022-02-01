# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Record
  # TODO: all the code should be here!
  attr_reader :id
  attr_accessor :title, :url, :votes, :first_name, :last_name

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    DB.results_as_hash = true
  end

  def self.find(id)
    ids = DB.execute("SELECT id FROM posts")
    id_arr = ids.map { |i| i["id"] }
    if id_arr.include?(id)
      queries = DB.execute("SELECT * FROM posts WHERE id = ?", id)
      query = queries.first
      post = Post.new(title: query['title'], id: query['id'], url: query['url'], votes: query['votes'])
    end
  end

  def self.all
    queries = DB.execute("SELECT * FROM posts")
    queries.map { |x| x = Post.new(title: x['title'], id: x['id'], url: x['url'], votes: x['votes']) }
  end

  def destroy
    # TODO: destroy the current instance from the database
    query = DB.execute('DELETE from posts WHERE id = ?', @id)
  end

  def save
    if @id.nil?
      queries = DB.execute("INSERT INTO posts (url, votes, title)
      VALUES ('#{@url}', #{@votes}, '#{@title}')")
      @id = DB.last_insert_row_id
    else
      queries = DB.execute("UPDATE posts SET url = '#{@url}', votes = #{@votes}, title = '#{@title}'
      WHERE id = ?", @id)
    end
  end
end
