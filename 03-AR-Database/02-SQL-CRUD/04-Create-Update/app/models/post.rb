class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
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
