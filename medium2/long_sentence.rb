def longest_sentence(file)
  file_data = File.read(file)
  file_data = file_data.gsub(/[?!]/ ,'?' => '.', '!' => '.').split('.')
  sen_lens = file_data.map {|sentence| sentence.split.size}
  puts file_data[sen_lens.each_with_index.max[1]]
end

longest_sentence("ex1.txt")
longest_sentence("ex2.txt")
