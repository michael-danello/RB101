def reverse!(arr)
  temp_arr = []
  arr.each_with_index do |el, idx|
    temp_arr[arr.size-1 - idx] = el
  end
  arr.each_with_index do |el, idx|
    arr[idx] = temp_arr[idx]
  end
  arr
end

def reverse(arr)
  temp_arr = []
  arr.each_with_index do |el, idx|
    temp_arr[arr.size-1 - idx] = el
  end
  temp_arr
end

list = [1,2,3,4]
result = reverse(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

# a cleaner solution
# def reverse!(array)
#   left_index = 0
#   right_index = -1
#
#   while left_index < array.size / 2
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end
#
#   array
# end
