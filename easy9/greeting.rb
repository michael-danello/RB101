def greetings(arr, hash)
  name = arr.join(" ")
  title = hash.values.join(" ")
  puts "Hello #{name}! Nice to have a #{title} around"
end


greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
