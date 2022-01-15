def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  email.match?(/^.+@.+\.[a-z]{3}/) || email.match?(/^.+@.+\.[a-z]{2}/)
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  emails.select { |email| valid?(email) }
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  emails.each do |email|
    pattern = /^(?<first_part>.+\.) (?<last_part>[a-z]+$)/
    match_data = email.match(pattern)
    puts match_data[:first_part]
    # if email
    # end
  end
end
emails = ["kevin@yahoo.fr", "edward@gmail.fr", "julien@mdn.com", "dimitri@berlin.de"]
group_by_tld(emails)

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
end

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
end
