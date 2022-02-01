require "faker"
# TODO: Write a seed to insert 100 posts in the database

puts 'Creating 100 fake posts...'
100.times do
  post = Post.new(
    title: Faker::TvShows::NewGirl.quote,
    url: Faker::Internet.url,
    votes: rand(0..100)
  )
  post.save!
end
puts 'Finished!'
