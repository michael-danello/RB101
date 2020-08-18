def short_long(str1, str2)
  len_arr = [str1, str2].sort_by { |e| e.length }
  len_arr[0] + len_arr[1] +len_arr[0]
end

puts short_long('abc', 'defgh') == "abcdefghabc"
puts short_long('abcde', 'fgh') == "fghabcdefgh"
puts short_long('', 'xyz') == "xyz"
