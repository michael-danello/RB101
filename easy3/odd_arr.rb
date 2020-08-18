def odd_arr(arr)
  arr.select.with_index do |el, idx|
    idx.even?
  end
end


puts odd_arr([2, 3, 4, 5, 6]) == [2, 4, 6]
puts odd_arr([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts odd_arr(['abc', 'def']) == ['abc']
puts odd_arr([123]) == [123]
puts odd_arr([]) == []
