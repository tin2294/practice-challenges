require "json"
require "open-uri"


word = "hello"

def api(word)
  url = "https://wagon-dictionary.herokuapp.com/#{word}"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)
  user["found"]
end


p api(word)
