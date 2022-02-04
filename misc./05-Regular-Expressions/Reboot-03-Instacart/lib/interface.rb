# TODO: you can build your instacart program here
inventory = {
  kiwi: {
    price: 1.25,
    stock: 1
  },
  banana: {
    price: 0.5,
    stock: 2
  },
  mango: {
    price: 4,
    stock: 1
  },
  asparagus: {
    price: 9,
    stock: 5
  }
}

def welcome(inventory)
  puts "-------------------- \nWelcome to Instacart\n--------------------"
  puts 'In our store today:'
  inventory.each { |key, value| puts "#{key.capitalize}: #{value[:price]}€ (#{value[:stock]} available)" }
  puts "--------------------"
end

def user_input(inventory)
  inventory = inventory
  puts "Which item? ('quit' to checkout)"
  item = gets.chomp.downcase.to_sym
  unless item.to_s == 'quit'
    puts 'How many?'
    quantity = gets.chomp.to_i
    if quantity <= inventory[item][:stock]
      { item.to_s => { price: inventory[item][:price], quantity: quantity } }
    else
      'Sorry there are not any left!'
    end
  end
end

def shopping(inventory)
  cart = {}
  welcome(inventory)
  add = user_input(inventory)
  until add.nil?
    if add.instance_of?(Hash)
      if cart[add.keys[0]].nil?
        # puts add[add.keys[0]][:price]
        cart[add.keys[0]] = { price: add[add.keys[0]][:price], quantity: add[add.keys[0]][:quantity] }
      else
        cart[add.keys[0]][:quantity] = cart[add.keys[0]][:quantity] + add[add.keys[0]][:quantity]
      end
      inventory[add.keys[0].to_sym][:stock] -= add[add.keys[0]][:quantity]
    elsif add.instance_of?(String)
      puts add
    end
    add = user_input(inventory)
  end
  puts "-------BILL---------"
  total = 0
  cart.each do |key, value|
    item_total = value[:price] * value[:quantity]
    total += item_total
    puts "#{key}: #{value[:price]}€ x #{value[:quantity]} = #{item_total}€"
  end
  puts "TOTAL: #{total}€"
end

shopping(inventory)
