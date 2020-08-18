def word_sizes(string)
  word_sizes_arr = string.split.map{|word| word.downcase.count("a-z")}
  word_hash = {}
  word_sizes_arr.each do |word_size|
    if word_hash.key?(word_size)
      word_hash[word_size] += 1
    else
      word_hash[word_size] = 1
    end
  end
  word_hash
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}


# counts = Hash.new(0) forces any keys to take an initial value of 0
