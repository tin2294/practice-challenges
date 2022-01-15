def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  regex_email = /^.+@.+\.(com|fr|de)/
  return email.match?(regex_email)
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  emails.select { |email2| valid?(email2) }
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  tld_hash = { "com" => com = [], "fr" => fr = [], "de" => de = [] }
  emails.each do |tld|
    case tld.match(/^.+@.+\.(com|fr|de)/)[1]
    when "com" then com << tld
    when "fr" then fr << tld
    when "de" then de << tld
    end
  end
  return tld_hash
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  match_user = email.match(/^(?<username>.+)@(?<domain>.+)\.(?<tld>.+)/)
  user_hash = {
    username: match_user[:username],
    domain: match_user[:domain],
    tld: match_user[:tld]
  }
  return user_hash
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

# def translate(keyword,language)
LANGUAGES = {
  com: :en,
  fr: :fr,
  de: :de
}
#  p LANGUAGES[:com]
def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  new_user_hash = compose_mail(email)
  tags = %i[subject body closing signature]
  new_tld = new_user_hash[:tld].to_sym
  lang = LANGUAGES[new_tld]
  tags.each { |x| new_user_hash[x] = LOCALES[lang][x] }
  return new_user_hash
  # TODO: translate subject, body, closing and signature, according to TLD
end
