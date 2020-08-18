def leading_substrings(string)
  l_strings = []
  string.chars.each_with_index {|_, idx| l_strings << string[0..idx]}
  l_strings
end

def substrings(string)
  substrings = []
  0.upto(string.size-1) do |index|
    substrings += leading_substrings(string[index..-1])
  end
  substrings
end

def palindromes(string)
  all_substrings = substrings(string)
  pallindromes = []
  all_substrings.each {|substring| pallindromes << substring if substring.reverse == substring && substring.size > 1 }
  pallindromes
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
