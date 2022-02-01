class PostsView
  # TODO: implement methods called by the PostsController
  def display(posts)
    posts.each_with_index do |item, index|
      puts "#{index + 1}. Post Title: #{item.title} - Votes: #{item.votes} - URL: #{item.url}"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the #{thing}:"
    print '>'
    gets.chomp
  end
end
