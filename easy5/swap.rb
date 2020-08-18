def swap(string)
  words = string.split
  chars = words.map{|word|  word.chars}
  chars.each {|word| swap!(word)}
  swap_words = chars.map {|word| word.join}
  swap_words.join(" ")
end


def swap!(arr)
  arr[0], arr[-1] = arr[-1], arr[0]
end


puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
