# TODO: you can build your horse race program here!
horses = %w[Millie Flash Levi Royal Casey Samara Audrey Sun Sparkle]

def contestants(horses)
  puts 'Here are our contestants:'
  horses.each { |horse| puts "- #{horse}" }
  puts 'Who would you like to place your bet on?'
  bet = gets.chomp
end

def winner(horses)
  horses[rand(0..(horses.count - 1))]
end

def results(bet, winner)
  if bet == winner
    puts 'Congratulations! You won the bet!'
    true
  else
    puts 'Sorry, try again next time!'
    false
  end
end

def intro
  puts 'Welcome to the race! How much money would you like to add to your balance?'
  balance = gets.chomp.to_i
end

def place_bets(horses)
  balance = intro
  while balance.positive?
    bet = contestants(horses)
    winner = winner(horses)
    if results(bet, winner)
      balance += 50
    else
      balance -= 10
    end
  end
end

place_bets(horses)
