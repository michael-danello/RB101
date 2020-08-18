def running_total(arr)
  return [] if arr.empty?
  run_arr = [arr.first]
  arr[1..-1].each {|num| run_arr << num + run_arr.last}
  run_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# here's a much better solution
# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end
