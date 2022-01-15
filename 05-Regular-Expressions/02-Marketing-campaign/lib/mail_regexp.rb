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
  hash = Hash.new(0)
  emails.each do |email|
    pattern = /[a-z]+$/
    match_data = email.match(pattern)
    if hash.keys.include?(match_data.to_s)
      hash[match_data.to_s] << email
    else
      hash[match_data.to_s] = [email]
    end
  end
  return hash
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  if valid?(email)
    match_data = email.match(/(^.*)(@)(.*)(\.)([a-z]+)/)
    {
      username: match_data[1],
      domain: match_data[3],
      tld: match_data[5]
    }
  end
end

LOCALES = {
  en: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

def translate(tld, locales)
  new_tld = tld.to_sym
  if locales[new_tld]
    locales[new_tld]
  else
    locales[:en]
  end
end

def compose_translated_email(email)
  hash = compose_mail(email)
  email = translate(hash[:tld], LOCALES)
  hash.merge(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
end
