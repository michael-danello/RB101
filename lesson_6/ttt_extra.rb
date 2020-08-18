def joinor(arr, joiner=", ", endword = "or")
  joined = arr[0..-2].join(joiner)
  joined + " #{endword} " + arr[-1].to_s
end



puts joinor([1, 2])                   # => "1 or 2"
puts joinor([1, 2, 3])                # => "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
