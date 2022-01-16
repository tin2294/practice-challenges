# TODO: you can build your calculator program here!
def calculate(operation, first_number, second_number)
  case operation
  when '+'
    first_number + second_number
  when '-'
    first_number - second_number
  when '*'
    first_number * second_number
  when '/'
    first_number / second_number
  end
end

def calculator
  puts 'Enter your first number'
  p '>'
  first_number = gets.chomp.to_i
  puts 'Enter a second number'
  p '>'
  second_number = gets.chomp.to_i
  puts 'Choose operation [+][-][*][/]'
  p '>'
  operation = gets.chomp
  puts "Result: #{calculate(operation, first_number, second_number)}"
end

calculator
