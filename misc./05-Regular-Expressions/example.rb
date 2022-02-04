# create an empty hash > hash
# emails (array) -> iterate through the array
# inside each one of the emails: get the tld from the email
# hash.keys check if it includes the tld, else create that
# key/value pair > com: dnknf@gmail.com


LOCALES[:en]
LOCALES['en']

LOCALES.keys.each { |key| puts key.class }
hash = Hash.new
puts hash.class

hash['en'] = 'dnknf@gmail.com'
puts hash

hash['en'] = 'vlf@gmail.com'
puts hash
