require_relative '../controllers/posts_controller'
class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display(elements)
    elements.each_with_index do |item, index|
      puts "#{index + 1}. ID: #{item.id} - Title: #{item.title} - Votes: #{item.votes} - URL: #{item.url}"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the #{thing}:"
    print '>'
    gets.chomp
  end

  def update_option
    puts "Please enter the field you would like to update (\"title\" or \"url\"):"
    print '>'
    gets.chomp
  end
end
