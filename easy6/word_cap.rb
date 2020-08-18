def word_cap(string)
  words = string.split
  words.map do |word|
    if word[0] == "\"" && word[-1] == "\""
      word
    else
      word.capitalize
    end
  end.join(" ")
end


puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
