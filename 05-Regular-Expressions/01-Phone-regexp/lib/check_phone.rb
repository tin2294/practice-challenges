def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number.match?(/-/)
    phone_number.gsub!(/-/, '')
  elsif phone_number.match?(/\s/)
    phone_number.gsub!(/\s/, '')
  end

  phone_number.match?(/0[1-9]\d{8}/ || /[+]33[1-9]\d{10}/)
end

# - It is valid when starting with a `0` and containing 10 digits. The second digit cannot be a 0.
# - It is also valid when starting with `+33` and containing 11 digits. And the digit following the `+33` cannot be a 0.

# The method should ignore spaces or dashes between digits.

puts french_phone_number?("0665363636")
#=> true

puts french_phone_number?("07 65 36 36 36")
#=> true

puts french_phone_number?("01-36-65-36-65")
#=> true

puts french_phone_number?("02 65 36 36")
#=> false
