class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def destroy
    # TODO: destroy the current instance from the database
    query = DB.execute('DELETE from posts WHERE id = ?', @id)
  end
end
