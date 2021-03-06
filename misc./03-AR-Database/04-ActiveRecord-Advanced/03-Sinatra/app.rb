require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'



get '/' do
  # TODO
  # 1. fetch posts from database.
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view
  @posts = Post.all
  @name = "Ting Ting"
  erb :posts # Do not remove this line
end

get '/ting' do
  # TODO
  # 1. fetch posts from database.
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view
  @posts = Post.all
  @name = "Ting Ting"
  erb :ting # Do not remove this line
end

# TODO: add more routes to your app!
post '/posts' do
  user = User.create(
    username: params[:username],
    email: params[:email]
  )
  user.save!

  Post.create(
    title: params[:title],
    url: params[:url],
    user: user
  )
  redirect "/"
end

post '/votes/:id' do
  post_id = params[:id]
  post = Post.find(post_id)
  post.votes += 1
  post.save!
  puts "post saved with #{post.votes}"
  redirect '/'
end
