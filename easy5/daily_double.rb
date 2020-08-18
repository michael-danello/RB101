def crunch(string)
  chars = string.chars
  final_string = ""
  last_char = ""
  chars.each do |char|
    if char == last_char
      next
    else
      final_string << char
      last_char = char
    end
  end
  final_string
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
