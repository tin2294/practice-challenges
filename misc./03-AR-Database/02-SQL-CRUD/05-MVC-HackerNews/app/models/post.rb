class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  # - initialize
  # - self.find
  # - self.all
  # - save
  # - destroy
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
