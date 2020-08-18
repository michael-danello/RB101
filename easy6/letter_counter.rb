def letter_case_count(string)
  l_hash = {}
  l_hash[:lowercase] = string.count("a-z")
  l_hash[:uppercase] = string.count("A-Z")
  l_hash[:neither] = string.length - (l_hash[:lowercase] + l_hash[:uppercase])
  l_hash
end


puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
