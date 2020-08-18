def buy_fruit(hash)
  fruit_list = []
  hash.each {|key, value| fruit_list += [key]*value}
  fruit_list
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
