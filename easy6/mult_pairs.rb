def multiply_all_pairs(arr1 , arr2)
  mult_pairs = []
  for num1 in arr1
    for num2 in arr2
      mult_pairs << num1*num2
    end
  end
  mult_pairs.sort
end



p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
