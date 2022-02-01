require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response).first(10)

repos.each do |item|
  url = "https://hacker-news.firebaseio.com/v0/item/#{item}.json"
  result = JSON.parse(RestClient.get(url))
  post = Post.new(
    title: result["title"],
    url: result["url"],
    votes: result["score"]
  )
  post.save!
end
