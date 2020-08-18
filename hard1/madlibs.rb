def madlib(file)
  file_data = File.read(file)
  replace_array = ["noun","adjective","adverb","verb"]
  loop do
    p (file_data.gsub(/[^0-9a-z ]/i, '').chomp.split)
    to_replace = file_data.gsub(/[^0-9a-z ]/i, '').chomp.split.detect {|word| replace_array.include?(word)}
    puts to_replace
    break if to_replace == nil
    puts "Please enter a #{to_replace}: "
    answer = gets.chomp
    file_data.sub!(to_replace, answer)
  end
  puts file_data
end
# detect returns the first value where the block is true COOL!

madlib("madlibs.txt")
