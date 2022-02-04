# TODO: Write a seed
require 'faker'

puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email
  )
  user.save!
  5.times do
    users = User.all
    post = Post.new(
      title: Faker::Quote.fortune_cookie,
      url: Faker::Internet.url,
      votes: rand(0..200),
      user: user
    )
    post.save!
  end
end
puts 'Finished!'
