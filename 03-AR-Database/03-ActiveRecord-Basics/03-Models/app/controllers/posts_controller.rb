require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    all = Post.all
    # TODO: give them to the view to be printed
    @view.display(all)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_user_for('title')
    url = @view.ask_user_for('url')
    votes = @view.ask_user_for('number of votes').to_i
    post = Post.new(title: title, url: url, votes: votes)
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    option = @view.update_option
    id = @view.ask_user_for('id').to_i
    post = Post.find(id)
    case option
    when "title" then post.title = @view.ask_user_for('title')
    when "url" then post.url = @view.ask_user_for('url')
    end
    post.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    id = @view.ask_user_for('id').to_i
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    id = @view.ask_user_for('id of the post to upvote').to_i
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
