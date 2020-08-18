def halvsies(arr)
  split = (arr.length.to_f/2).ceil-1
  [arr[0..split], arr[split+1..-1]]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
