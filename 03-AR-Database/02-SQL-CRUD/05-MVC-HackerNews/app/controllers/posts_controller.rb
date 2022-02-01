require_relative '../models/post'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    post = Post.all
    @view.display(post)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_user_for('title of the new post')
    url = @view.ask_user_for('url')
    votes = @view.ask_user_for('votes')
    new_post = Post.new(title: title, url: url, votes: votes)
    new_post.save
  end

  def update
    # TODO: implement updating an existing post
    index
    post = Post.all
    post_index = @view.ask_user_for('index of the post to edit').to_i - 1
    edit_id = post[post_index].id
    title = @view.ask_user_for('new title')
    url = @view.ask_user_for('new url')
    votes = post[post_index].votes
    edit_post = Post.new(title: title, url: url, votes: votes, id: edit_id)
    edit_post.save
  end

  def destroy
    # TODO: implement destroying a post
    index
    post = Post.all
    post_index = @view.ask_user_for('index of the post to destroy').to_i - 1
    post[post_index].destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    post = Post.all
    post_index = @view.ask_user_for('index of the post to upvote').to_i - 1
    edit_id = post[post_index].id
    title = post[post_index].title
    url = post[post_index].url
    votes = post[post_index].votes + 1
    edit_post = Post.new(title: title, url: url, votes: votes, id: edit_id)
    edit_post.save
  end
end
